class Cipher {

    static let letters = "abcdefghijklmnopqrstuvwxyz"

    private(set) var key: String

    init() {
        self.key = String((0..<100).compactMap { _ in Cipher.letters.randomElement() })
    }

    init?(key: String) {
        guard key.isEmpty == false, key.allSatisfy({ $0.isLowercase }) else { return nil }
        self.key = key
    }

    // MARK: -

    func encode(_ string: String) -> String {
        return self.code(string, isEncode: true)
    }

    func decode(_ string: String) -> String {
        return self.code(string, isEncode: false)
    }

    private func code(_ string: String, isEncode: Bool) -> String {
        var result = ""

        for (idx, ch) in string.enumerated() {
            if let diff = self.key(offset: idx) {
                let nDiff = isEncode ? diff : Cipher.letters.count - diff
                let char = self.char(ch, with: nDiff)
                result += String(char)
            } else {
                result += String(ch)
            }
        }
        return result
    }

    // MARK: - Helpers

    private func key(offset: Int) -> Int? {
        let nOffset = offset % self.key.count
        let char = self.key.substring(with: nOffset..<nOffset + 1)
        for (idx, ch) in Cipher.letters.enumerated() where String(ch) == char {
            return idx
        }
        return nil
    }

    private func char(_ char: Character, with idx: Int) -> String {
        let l = Cipher.letters
        guard let lIdx = l.index(of: char) else { return String(char) }
        let nOffset = (lIdx + idx) % Cipher.letters.count
        return l.substring(with: nOffset..<nOffset + 1)
    }
}

extension String {
    func index(of char: Character) -> Int? {
        for (idx, ch) in self.enumerated() where ch == char { return idx }
        return nil
    }

    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
