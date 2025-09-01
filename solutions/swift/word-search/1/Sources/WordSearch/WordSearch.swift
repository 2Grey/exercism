import Foundation

extension StringProtocol {
    subscript(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

func search(words: [String], in grid: [String]) -> [String: WordLocation?] {
    var foundLocations = [String: WordLocation?]()

    let directions = [
        (dr: 0, dc: 1),
        (dr: 0, dc: -1),
        (dr: 1, dc: 0),
        (dr: -1, dc: 0),
        (dr: 1, dc: 1),
        (dr: 1, dc: -1),
        (dr: -1, dc: 1),
        (dr: -1, dc: -1)
    ]

    let numRows = grid.count
    guard numRows > 0 else { return [:] }
    let numCols = grid[0].count
    guard numCols > 0 else { return [:] }

    for word in words {
        guard !word.isEmpty else { continue }
        let firstLetter = word.first!

        searchGrid: for row in 0..<numRows {
            for col in 0..<numCols {
                if grid[row][col] == firstLetter {

                    let startPoint = WordLocation.Location(row: row + 1, column: col + 1)
                    for direction in directions {
                        var found = true
                        for i in 1..<word.count {
                            let nextRow = row + i * direction.dr
                            let nextCol = col + i * direction.dc

                            if nextRow < 0 || nextRow >= numRows || nextCol < 0 || nextCol >= numCols {
                                found = false
                                break
                            }

                            if grid[nextRow][nextCol] != word[word.index(word.startIndex, offsetBy: i)] {
                                found = false
                                break
                            }
                        }

                        if found {
                            let endPoint = WordLocation.Location(
                                row: row + (word.count - 1) * direction.dr + 1,
                                column: col + (word.count - 1) * direction.dc + 1
                            )
                            foundLocations[word] = WordLocation(start: startPoint, end: endPoint)
                            break searchGrid
                        }
                    }
                }
            }
        }
    }

    return foundLocations
}
