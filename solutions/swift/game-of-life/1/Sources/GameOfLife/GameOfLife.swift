
func tick(_ initial: [[Int]]) -> [[Int]] {
    guard !initial.isEmpty else { return [] }
    guard !initial[0].isEmpty else { return [] }
    let rows = initial.count
    let cols = initial[0].count

    var result = initial

    for r in 0..<rows {
        for c in 0..<cols {
            let liveNeighbors = countLiveNeighbors(initial, r, c)
            switch initial[r][c] {
            case 1:
                if liveNeighbors < 2 || liveNeighbors > 3 {
                    result[r][c] = 0
                }
            case 0:
                if liveNeighbors == 3 {
                    result[r][c] = 1
                }
            default: break
            }
        }
    }
    return result
}

func countLiveNeighbors(_ grid: [[Int]], _ row: Int, _ col: Int) -> Int {
    let rows = grid.count
    guard rows > 0 else { return 0 }
    let cols = grid[0].count

    var liveNeighbors = 0
    for i in -1...1 {
        for j in -1...1 {
            if i == 0 && j == 0 {
                continue
            }

            let neighborRow = row + i
            let neighborCol = col + j
            
            if neighborRow >= 0 && neighborRow < rows && neighborCol >= 0 && neighborCol < cols {
                if grid[neighborRow][neighborCol] == 1 {
                    liveNeighbors += 1
                }
            }
        }
    }
    return liveNeighbors
}
