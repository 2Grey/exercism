import Foundation
final class Board {

    enum BoardError: Error {
        case differentLength
        case faultyBorder
        case invalidCharacter
    }

    private var board: [String] = []

    init(_ raw: [String]) throws {
        var input = raw

        guard Board.checkBorder(input.removeFirst()), Board.checkBorder(input.removeLast()) else { throw BoardError.faultyBorder }

        input = input.map({ $0.trim() })
        try Board.checkLines(input)

        for line in input {
            board.append(line)
        }
    }

    func transform() -> [String] {
        let border = "+" + String(repeating: "-", count: self.board.first!.count) + "+"
        var result: [String] = [border]

        for (lineIdx, line) in self.board.enumerated() {

            var tmp = "|"
            for (charIdx, char) in line.enumerated() {
                if char == "*" {
                    tmp += String(char)
                } else {
                    let count = self.countMines(at: lineIdx, row: charIdx)
                    tmp += count > 0 ? "\(count)" : " "
                }
            }
            tmp += "|"
            result.append(tmp)
        }
        result.append(border)
        return result
    }

    private func countMines(at line: Int, row: Int) -> Int {
        let length = self.board.first!.count
        var xMinIdx = row - 1; xMinIdx = max(0, xMinIdx)
        var xMaxIdx = row + 1; xMaxIdx = min(xMaxIdx, length - 1)
        var yMinIdx = line - 1; yMinIdx = max(0, yMinIdx)
        var yMaxIdx = line + 1; yMaxIdx = min(yMaxIdx, self.board.count - 1)

        var count = 0
        for boardLine in board[yMinIdx...yMaxIdx] {
            for char in boardLine[xMinIdx...xMaxIdx] where char == "*" {
                count += 1
            }
        }

        return count
    }
}

extension Board {
    static func checkBorder(_ border: String) -> Bool {
        guard border.hasPrefix("+") else { return false }
        guard border.hasSuffix("+") else { return false }

        let newBorder = border.trim()
        let filter = newBorder.filter({ $0 == "-" })
        return newBorder.count == filter.count
    }

    static func checkLines(_ lines: [String]) throws {
        try lines.forEach({ guard $0.allSatisfy({ val in val == "*" || val == " " }) else {
            throw BoardError.invalidCharacter
        }})

        var length = 0
        for (idx, line) in lines.enumerated() {
            guard idx != 0 else { length = line.count; continue }
            if line.count != length {
                throw BoardError.differentLength
            }
        }
    }
}

extension String {
    func trim() -> String {
        var tmp = self
        tmp.removeLast()
        tmp.removeFirst()
        return tmp
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
}
