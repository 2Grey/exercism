
class SimulatedRobot {

    enum Movements: Character {
        case turnRight = "R"
        case turnLeft = "L"
        case advance = "A"
    }

    enum Direction {
        case north
        case west
        case south
        case east

        var left: Direction {
            switch self {
            case .north: return .west
            case .west: return .south
            case .south: return .east
            case .east: return .north
            }
        }

        var right: Direction {
            switch self {
            case .north: return .east
            case .west: return .north
            case .south: return .west
            case .east: return .south
            }
        }
    }

    private(set) var bearing: Direction = .north
    private(set) var coordinates: [Int] = [0, 0]

    // MARK: -

    func orient(_ direction: Direction) {
        self.bearing = direction
    }

    func at(x: Int, y: Int) {
        self.coordinates = [x, y]
    }

    func place(x: Int, y: Int, direction: Direction) {
        self.coordinates = [x, y]
        self.bearing = direction
    }

    // MARK: -

    func turnRight() {
        self.bearing = self.bearing.right
    }

    func turnLeft() {
        self.bearing = self.bearing.left
    }

    func advance() {
        var x = self.coordinates.first ?? 0
        var y = self.coordinates.last ?? 0

        switch self.bearing {
        case .north: y += 1
        case .east: x += 1
        case .south: y -= 1
        case .west: x -= 1
        }

        self.coordinates = [x, y]
    }

    // MARK: -

    func instructions(_ input: String) -> [Movements] {
        return input.compactMap { Movements(rawValue: $0) }
    }

    func evaluate(_ input: String) {
        let commands = self.instructions(input)

        for command in commands {
            switch command {
            case .turnLeft: self.turnLeft()
            case .turnRight: self.turnRight()
            case .advance: self.advance()
            }
        }
    }
}
