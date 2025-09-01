import Foundation

enum BaseError: Error {
    case negativeDigit
    case invalidPositiveDigit
    case invalidInputBase
    case invalidOutputBase
}

struct Base {
    static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
        guard inputBase > 1 else { throw BaseError.invalidInputBase }
        guard outputBase > 1 else { throw BaseError.invalidOutputBase }
        guard inputDigits.allSatisfy({ $0 < inputBase }) else { throw BaseError.invalidPositiveDigit }
        guard inputDigits.allSatisfy({ $0 >= 0 }) else { throw BaseError.negativeDigit }

        let dec = inputDigits.from(base: inputBase)
        guard dec > 0 else { return [] }
        return dec.to(base: outputBase)
    }
}

extension Array where Element == Int {
    func from(base: Int) -> Int {
        var results: [Int] = []

        var p = Double(self.count - 1)
        for value in self {
            let tmp = Double(value) * pow(Double(base), p)
            results.append(Int(tmp))
            p -= 1.0
        }
        return results.reduce(0, +)
    }
}

extension Int {
    func to(base: Int) -> [Int] {
        var value = self
        var result: [Int] = []
        while value >= base {
            let div = value / base
            result.append(value % base)
            value = div
        }

        result.append(value)

        return result.reversed()
    }
}
