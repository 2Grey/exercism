final class Matrix {

    let matrix: [[Int]]

    init(_ raw: String) {
        var matrix: [[Int]] = []

        let rows = raw.split(separator: "\n")
        for row in rows {
            let columns = row.split(separator: " ").compactMap({ Int($0)})
            matrix.append(columns)
        }

        self.matrix = matrix
    }

    var rows: [[Int]] {
        self.matrix
    }

    var columns: [[Int]] {
        let columns = self.matrix.count
        let rows = self.matrix.reduce(0) { max($0, $1.count) }

        return (0 ..< rows).reduce(into: []) { result, row in
            result.append((0 ..< columns).reduce(into: []) { result, column in
                result.append(row < self.matrix[column].count ? self.matrix[column][row] : 0)
            })
        }
    }
}

