struct Diamond {

    static let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "x", "y", "z"]

    static func makeDiamond(letter: String) -> [String] {
        guard let idx = Diamond.alphabet.index(of: letter.lowercased()) else { return [] }
        let lines = 2 * idx + 1
        let halfLine = lines / 2  + 1

        var result: [String] = []
        for line in 0..<halfLine {
            let letter = Diamond.alphabet[line].uppercased()

            let side = halfLine - line - 1
            let center = max(0, 2 * line - 1)
            let sideSpaces = String(repeating: " ", count: side)
            let centerSpaces = String(repeating: " ", count: center)

            var tmp = ""
            tmp += sideSpaces
            tmp += letter
            if center > 0 {
                tmp += centerSpaces
                tmp += letter
            }
            tmp += sideSpaces
            result.append(tmp)

        }
        let full = result + result.dropLast().reversed()
        return full
    }
}
