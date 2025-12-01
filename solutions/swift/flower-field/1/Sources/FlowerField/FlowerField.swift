import Foundation
struct Board {

    private let board: [String]

    init(_ board: [String]) {
        self.board = board
    }

    func transform() -> [String] {
        guard !self.board.isEmpty else { return [] }

        var grid = board.map { Array($0) }

        let rows = grid.count
        let cols = grid[0].count

        let moves = [ (-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1),  (1, 0),  (1, 1) ]

        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == "*" {
                    continue
                }

                var tmp = 0
                for (dR, dC) in moves {
                    let nRow = row + dR
                    let nCol = col + dC

                    if nRow >= 0, nRow < rows, nCol >= 0, nCol < cols {
                        if grid[nRow][nCol] == "*" {
                            tmp += 1
                        }
                    }
                }

                if tmp > 0 {
                    grid[row][col] = Character("\(tmp)")
                }
            }
        }
        return grid.map { String($0) }
    }
}
