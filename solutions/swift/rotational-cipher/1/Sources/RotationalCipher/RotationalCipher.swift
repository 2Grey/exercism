struct RotationalCipher {

    static let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    static func rotate(_ input: String, ROT: Int) -> String {
        var result: [String] = []
        for char in input {
            guard let idx = self.alphabet.index(of: char.lowercased()) else { result.append(String(char)); continue }
            let newIdx = (idx + ROT) % self.alphabet.count
            var r = self.alphabet[newIdx]
            if char.isUpper {
                r = r.uppercased()
            }
            result.append(r)
        }

        return result.joined()
    }
}

extension Character {
    var isUpper: Bool {
        return String(self) == self.uppercased()
    }
}
