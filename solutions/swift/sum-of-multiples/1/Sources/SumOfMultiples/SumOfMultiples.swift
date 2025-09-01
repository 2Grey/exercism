final class SumOfMultiples {

    class func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
        let result = inMultiples.reduce(into: [Int](), { $0.append(contentsOf: self.sum(of: $1, to: limit)) })
        return Set(result).reduce(0, +)
    }

    class private func sum(of num: Int, to: Int) -> [Int] {
        guard num > 0, num < to else { return [0] }

        var result: [Int] = []
        var tmp = num
        while tmp < to {
            result.append(tmp)
            tmp += num
        }
        return result
    }
}
