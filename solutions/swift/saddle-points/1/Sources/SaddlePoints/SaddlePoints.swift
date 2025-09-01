struct SaddlePointsMatrix {

    let rows: [[Int]]
    let columns: [[Int]]

    var saddlePoints: [[Int]] = []

    init(_ raw: String) {
        let matrix = SaddlePointsMatrix.matrix(from: raw)

        self.rows = matrix
        self.columns = SaddlePointsMatrix.columns(from: matrix)
        self.saddlePoints = SaddlePointsMatrix.saddlePoints(for: matrix)
    }

    private static func matrix(from input: String) -> [[Int]] {
        var result: [[Int]] = []

        for row in input.split(separator: "\n") {
            let values = row
                .split(separator: " ")
                .compactMap({ Int($0) })
            result.append(values)
        }
        return result
    }

    private static func columns(from matrix: [[Int]]) -> [[Int]] {
        let colsCount = matrix.first?.count ?? 0
        let rowsCount = matrix.count

        var columns: [[Int]] = []
        for idx in 0..<colsCount {
            var result: [Int] = []
            for iIdx in 0..<rowsCount {
                result.append(matrix[iIdx][idx])
            }
            columns.append(result)
        }

        return columns
    }


    private static func saddlePoints(for matrix: [[Int]]) -> [[Int]] {
        let colsCount = matrix.first?.count ?? 0
        let rowsCount = matrix.count

        var max = 0
        var maxJ = 0
        var flag = false

        var result: [[Int]] = []

        for i in 0..<rowsCount {
            max = matrix[i][0]
            maxJ = 0

            for j in 0..<colsCount {
                let value = matrix[i][j]
                if value > max {
                    max = value
                    maxJ = j
                }
            }
            flag = true

            for j in 0..<rowsCount {
                if max > matrix[j][maxJ] {
                    flag = false
                    continue
                }
            }

            if flag {
                result.append([i, maxJ])
            }
        }
        return result
    }
}


//It's called a "saddle point" because it is greater than or equal to every element in its row and less than or equal to every element in its column
