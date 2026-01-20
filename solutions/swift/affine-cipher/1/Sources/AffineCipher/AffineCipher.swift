struct AffineCipher {

    static let abc = "abcdefghijklmnopqrstuvwxyz"
    static let m = abc.count

    func encode(_ phrase: String, keyA: Int, keyB: Int) throws -> String {
        guard keyA.isCoprime(with: Self.m) else {
            throw AffineCipherError.keysNotCoprime
        }
        var result = ""
        for ch in phrase.lowercased() {
            if ch.isNumber {
                result.append(String(ch))
            } else if ch.isLetter {
                let i = Self.abc.firstIndex(of: ch)!.utf16Offset(in: Self.abc)
                let idx = (keyA * i + keyB) % Self.m
                result.append(Self.abc[idx])
            }
        }
        return result.prepareResult()
    }

    func decode(_ phrase: String, keyA: Int, keyB: Int) throws -> String {
        guard let mmi = keyA.mmi(with: Self.m) else {
            throw AffineCipherError.keysNotCoprime
        }

        var result = ""
        for ch in phrase.lowercased() {
            if ch.isNumber {
                result.append(String(ch))
            } else if ch.isLetter {
                let y = Self.abc.firstIndex(of: ch)!.utf16Offset(in: Self.abc)
                let numerator = mmi * (y - keyB)
                let idx = (numerator % Self.m + Self.m) % Self.m
                result.append(Self.abc[idx])
            }
        }
        return result
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    func prepareResult() -> String {
        var result = ""
        for (idx, ch) in self.enumerated() {
            if idx > 0, idx.isMultiple(of: 5) { result.append(" ") }
            result.append(String(ch))
        }
        return result
    }
}


extension Int {
    private static func gcd(_ a: Int, _ b: Int) -> Int {
        var a = abs(a)
        var b = abs(b)
        while b != 0 {
            (a, b) = (b, a % b)
        }
        return a
    }

    func isCoprime(with number: Int) -> Bool {
        return Int.gcd(self, number) == 1
    }

    func mmi(with number: Int) -> Int? {
        for x in 1..<number {
            if (self * x) % number == 1 {
                return x
            }
        }
        return nil
    }
}
