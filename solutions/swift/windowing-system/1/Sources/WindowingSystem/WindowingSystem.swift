// MARK: - Size

struct Size: CustomStringConvertible {
    let height: Int
    let width: Int

    init(width: Int = 80, height: Int = 60) {
        self.width = width
        self.height = height
    }

    mutating func resize(newWidth: Int, newHeight: Int) {
        self = Size(width: newWidth, height: newHeight)
    }

    var description: String {
        "Size: (\(width) x \(height))"
    }
}

// MARK: - Position

struct Position: CustomStringConvertible {
    let x: Int
    let y: Int

    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }

    mutating func moveTo(newX: Int, newY: Int) {
        self = Position(x: newX, y: newY)
    }

    var description: String {
        "Position: (\(x), \(y))"
    }
}

// MARK: - Window

class Window {
    let screenSize = Size(width: 800, height: 600)
    var title = "New Window"
    var size = Size()
    var position = Position()
    var contents: String?

    // MARK: - Size

    func resize(to: Size) {
        let width = max(1, min(screenSize.width - position.x, to.width))
        let height = max(1, min(screenSize.height - position.y, to.height))
        self.size.resize(newWidth: width, newHeight: height)
    }

    // MARK: - Position

    func move(to: Position) {
        let x = max(0, min(screenSize.width - size.width, to.x))
        let y = max(0, min(screenSize.height - size.height, to.y))
        self.position.moveTo(newX: x, newY: y)
    }

    // MARK: - Text

    func update(title: String) {
        self.title = title
    }

    func update(text: String?) {
        self.contents = text
    }

    func display() -> String {
        let contentDescription = self.contents ?? "[This window intentionally left blank]"
        return "\(self.title)\n\(position.description), \(size.description)\n\(contentDescription)\n"
    }
}
