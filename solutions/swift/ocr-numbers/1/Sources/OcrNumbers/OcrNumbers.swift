struct OCR {

    enum Numbers {
        static let zero     = [ " _ ",   "| |", "|_|" ]
        static let one      = [ "   ",  "  |",  "  |" ]
        static let two      = [ " _ ",  " _|",  "|_ " ]
        static let three    = [ " _ ",  " _|",  " _|" ]
        static let four     = [ "   ",  "|_|",  "  |" ]
        static let five     = [ " _ ",  "|_ ",  " _|" ]
        static let six      = [ " _ ",  "|_ ",  "|_|" ]
        static let seven    = [ " _ ",  "  |",  "  |" ]
        static let eight    = [ " _ ",  "|_|",  "|_|" ]
        static let nine     = [ " _ ",  "|_|",  " _|" ]

        static let all = [ Numbers.zero, Numbers.one, Numbers.two, Numbers.three, Numbers.four, Numbers.five, Numbers.six, Numbers.seven, Numbers.eight, Numbers.nine ]
    }

    enum OCRError: Error {
        case invalidNumberOfLines
        case invalidNumberOfColumns
    }

    let text: String

    init(_ text: String) throws {
        let lines = text.split(separator: "\n")
        guard lines.count % 4 == 0 else { throw OCRError.invalidNumberOfLines }
        guard lines.filter({ $0.count % 3 != 0 }).count == 0 else { throw OCRError.invalidNumberOfColumns }
        self.text = text
    }

    func converted() -> String {
        let lines = text.split(separator: "\n").map { String($0) }
        let allLines = self.splitLines(lines)

        let count = (lines.first?.count ?? 0) / 3

        var result: [String] = []
        var tmp: [String] = []
        for line in allLines {
            for idx in 0..<count {
                let split = self.split(line, count: idx)
                tmp.append(self.findNumber(for: split))
            }
            result.append(tmp.joined())
            tmp = []
        }

        return result.joined(separator: ",")
    }

    private func findNumber(for line: [String]) -> String {
        for (idx, number) in Numbers.all.enumerated() where number == line {
            return "\(idx)"
        }
        return "?"
    }

    private func split(_ all: [String], count: Int) -> [String] {
        let line = all.first!
        let startIdx = line.index(line.startIndex, offsetBy: count * 3)
        let endIdx = line.index(startIdx, offsetBy: 3)
        return all.map({ $0[startIdx..<endIdx]}).dropLast().map { String($0) }
    }

    private func splitLines(_ all: [String]) -> [[String]] {
        var result: [[String]] = []
        var tmp: [String] = []
        for (idx, line) in all.enumerated() {
            tmp.append(line)
            if (idx + 1) % 4 == 0 {
                result.append(tmp)
                tmp = []
            }
        }
        return result
    }
}
