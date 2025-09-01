struct PascalsTriangle {

    private(set) var rows: [[Int]]

    init(_ iRows: Int) {
        self.rows = PascalsTriangle.calculate(for: iRows)
    }

    private static func calculate(for value: Int) -> [[Int]] {
        var result: [[Int]] = [[1]]
        guard value > 1 else { return result }

        for _ in 1..<value {
            let last = [0] + result.last! + [0]

            var tmp: [Int] = []
            for idx in 0..<last.count - 1 {
                tmp.append(last[idx] + last[idx + 1])
            }
            result.append(tmp)
        }
        return result
    }
}

