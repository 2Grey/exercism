class Crypto {

    var plaintextSegments: [String]
    let normalizePlaintext: String
    let ciphertext: String
    let normalizeCiphertext: String
    let size: Int

    init(_ text: String) {
        self.normalizePlaintext = text.filter({ $0.isLetter || $0.isNumber }).lowercased()
        self.size = Crypto.size(of: self.normalizePlaintext)
        self.plaintextSegments = Crypto.splitText(self.normalizePlaintext, size: self.size)
        self.ciphertext = Crypto.ciphertext(self.normalizePlaintext, size: self.size)
        self.normalizeCiphertext = Crypto.splitText(self.ciphertext, size: self.size - 1).joined(separator: " ")
    }

    static func size(of text: String) -> Int {
        for i in 1... where i * i >= text.count { return i }
        return 0
    }

    static func splitText(_ text: String, size: Int) -> [String] {
        var result: [String] = []
        var tmp: [String] = []
        for (idx, char) in text.enumerated() {
            tmp.append(String(char))
            if (idx + 1) % size == 0 {
                result.append(tmp.joined())
                tmp = []
            }
        }
        if tmp.isEmpty == false {
            result.append(tmp.joined())
        }
        return result
    }

    static func ciphertext(_ text: String, size: Int) -> String {
        var arr = Array(repeating: "", count: size)
        for (idx, char) in text.enumerated() {
            let i = idx % size
            arr[i] += String(char)
        }
        return arr.joined()
    }
}
