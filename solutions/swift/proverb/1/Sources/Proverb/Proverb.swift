
extension Array where Element == String {

    func recite() -> String {
        guard self.isEmpty == false else { return "" }
        var result: [String] = []

        for (idx, word) in self.dropLast().enumerated() {
            let nextWord = self[idx + 1]
            result.append("For want of a \(word) the \(nextWord) was lost.")
        }

        result.append("And all for the want of a \(self[0]).")

        return result.joined(separator: "\n")
    }
}
