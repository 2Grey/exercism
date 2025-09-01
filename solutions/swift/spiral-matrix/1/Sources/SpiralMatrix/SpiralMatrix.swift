
func prepareMatrix(size: Int) -> [[Int]] {
    var result = [[Int]]()
    result.reserveCapacity(size)

    for _ in 0..<size {
        result.append(Array(repeating: 0, count: size))
    }
    return result
}

enum Direction {
    case right
    case down
    case left
    case up

    var nextDirection: Direction {
        switch self {
        case .right: return .down
        case .down: return .left
        case .left: return .up
        case .up: return .right
        }
    }
}

func getNewCoordinates(x: Int, y: Int, direction: Direction) -> (Int, Int) {
    switch direction {
    case .right: return (x + 1, y)
    case .down: return (x, y + 1)
    case .left: return (x - 1, y)
    case .up: return (x, y - 1)
    }
}

func canMakeNextMove(x: Int, y: Int, size: Int, result: [[Int]]) -> Bool {
    return x >= 0 && y >= 0 && x < size && y < size && result[y][x] == 0
}

func spiralMatrix(size: Int) -> [[Int]] {
    var result = prepareMatrix(size: size)

    var dir = Direction.right
    var val = 1
    var y = 0
    var x = 0

    let endValue = size * size
    while val <= endValue {
        result[y][x] = val
        val += 1
        let newCoordinates = getNewCoordinates(x: x, y: y, direction: dir)
        if canMakeNextMove(x: newCoordinates.0, y: newCoordinates.1, size: size, result: result) {
            (x, y) = newCoordinates
        } else {
            dir = dir.nextDirection
            (x, y) = getNewCoordinates(x: x, y: y, direction: dir)
        }
    }

    return result
}
