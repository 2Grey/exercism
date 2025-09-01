
class Queens: CustomStringConvertible {

    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }

    let white: [Int]
    let black: [Int]

    init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        guard white != black else { throw InitError.sameSpace }
        if let whiteError = Queens.checkCoordinates(white) { throw whiteError }
        if let blackError = Queens.checkCoordinates(black) { throw blackError }

        self.white = white
        self.black = black
    }

    var canAttack: Bool {
        let isSameRow = white.first! == black.first!
        let isSameCol = white.last! == black.last!
        let isLine = abs(white.first! - white.last!) == abs(black.first! - black.last!)
        return isSameRow || isSameCol || isLine
    }

    // MARK: - Errors

    static func checkCoordinates(_ coord: [Int]) -> InitError? {
        guard coord.count == 2 else { return InitError.incorrectNumberOfCoordinates }
        let left = coord.first!
        let right = coord.last!
        let isValid = left >= 0 && left <= 8 && right >= 0 && right <= 8
        return isValid ? nil : InitError.invalidCoordinates
    }

    // MARK: - CustomStringConvertible

    var description: String {
        let line = String(repeating: "_", count: 8)
        var result = Array(repeating: line, count: 8)

        var whiteLine = Array(result[white.first!])
        whiteLine[white.last!] = "W"
        result[white.first!] = String(whiteLine)

        var blackLine = Array(result[black.first!])
        blackLine[black.last!] = "B"
        result[black.first!] = String(blackLine)

        var resultString: [String] = []
        for line in result {
            let v = line.reduce("", { $0 + String($1) + " " }).dropLast()
            resultString.append(String(v))
        }
        return resultString.joined(separator: "\n")
    }
}
