struct Diamond {

    static let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    static func makeDiamond(letter: String) -> [String] {
        guard let idx = Diamond.alphabet.index(of: letter.lowercased()) else { return [] }

        let array = Diamond.alphabet[...idx]

        var result: [String] = []
        for (idx, ch) in array.enumerated() {
            let tmp = String(repeating: " ", count: array.count - 1 - idx) + ch.uppercased() + String(repeating: " ", count: idx)
            result.append(tmp + String(tmp.dropLast().reversed()))
        }

        return result + result.dropLast().reversed()
    }
}
