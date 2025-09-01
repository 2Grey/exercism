import Foundation
struct Transpose {

    static func transpose(_ lines: [String]) -> [String] {
        let maxCount = lines.map({$0.count}).max() ?? 0
        var result: [String] = Array(repeating: String(repeating: " ", count: lines.count), count: maxCount)


        for (idx, line) in lines.enumerated() {
            for (cIdx, char) in line.enumerated() {
                var aLine = result[cIdx]
                aLine = self.replace(myString: aLine, idx, char)
                result[cIdx] = aLine
            }
        }
        return result.map { $0.allSatisfy({ $0 == " " }) ? "" : $0.trimEnd() }
    }

    private static func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
}

extension String {
    func trimEnd() -> String {
        var tmp = self
        while tmp.hasSuffix(" ") {
            tmp.removeLast()
        }
        return tmp
    }
}
