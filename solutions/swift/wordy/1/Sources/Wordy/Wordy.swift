import Foundation

struct WordProblem {

    enum mError: Error {
        case someError
    }

    static let prefix = "What is "

    enum Operation: String, CaseIterable {
        case plus = "plus"
        case minus = "minus"
        case mult = "multiplied by"
        case div = "divided by"
    }

    let input: String

    init(_ input: String) {
        self.input = input
    }

    func answer() throws -> Int {
        var input = self.input

        guard input.hasPrefix(WordProblem.prefix) else { throw mError.someError }
        input.removeFirst(WordProblem.prefix.count)

        var result = 0

        guard let firstNumber = self.getNumber(from: input) else { throw mError.someError }
        result = firstNumber.0
        input = firstNumber.1

        var anyOp = false

        while let op = self.getOperation(from: input) {
            anyOp = true
            input = op.1

            guard let numberForOp = self.getNumber(from: op.1) else { return result }
            result = self.calculate(with: op.0, lhs: result, rhs: numberForOp.0)
            input = numberForOp.1
        }

        guard anyOp else { throw mError.someError }
        return result
    }

    private func getNumber(from string: String) -> (Int, String)? {
        let string = string.trim()
        guard let idx = string.firstIndex(where: { !$0.isNumber && $0 != "-" }) else { return nil }
        guard let num = Int(string[..<idx]) else { return nil }

        let str = string[idx...]
        return (num, String(str))
    }

    private func getOperation(from string: String) -> (Operation, String)? {
        let string = string.trim()

        for op in Operation.allCases {
            if string.hasPrefix(op.rawValue) {
                let idx = string.index(string.startIndex, offsetBy: op.rawValue.count)
                return (op, String(string[idx...]))
            }
        }

        return nil
    }

    private func calculate(with op: Operation, lhs: Int, rhs: Int) -> Int {
        switch op {
        case .plus: return lhs + rhs
        case .minus: return lhs - rhs
        case .mult: return lhs * rhs
        case .div: return lhs / rhs
        }
    }
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}
