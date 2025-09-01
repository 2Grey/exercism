class NumberSeries {

    enum NumberSeriesError: Error {
        case spanLongerThanStringLength
        case invalidCharacter
        case negativeSpan
    }

    private let value: String

    init(_ value: String) throws {
        guard value.allSatisfy({ $0.isNumber }) else { throw NumberSeriesError.invalidCharacter }
        self.value = value
    }

    func largestProduct(_ product: Int) throws -> Int {
        guard product >= 0 else { throw NumberSeriesError.negativeSpan }
        guard product <= value.count else { throw NumberSeriesError.spanLongerThanStringLength }
        guard product > 1 else { return 1 }

        let chunks = value.chunked(into: product)
        var max = chunks.first?.sum() ?? 0
        for i in 1..<chunks.count {
            let sum = chunks[i].sum()
            if sum > max {
                max = sum
            }
        }
        return max
    }
}

extension String {
    func chunked(into size: Int) -> [[Character]] {
        var result: [[Character]] = []

        var offset = 0

        while offset + size <= self.count {
            var tmp: [Character] = []
            for i in 0..<size {
                let idx = self.index(self.startIndex, offsetBy: offset + i)
                tmp.append(self[idx])
            }
            offset += 1
            result.append(tmp)
        }

        return result
    }
}

extension Array where Element == Character {
    func sum() -> Int {
        return self.compactMap({ Int(String($0)) }).reduce(1, *)
    }
}
