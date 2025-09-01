

struct CollatzConjecture {

    enum StepError: Error {
        case wrongInput
    }

    static func steps(_ value: Int) throws -> Int {
        guard value > 0 else { throw StepError.wrongInput }

        var tmp = value
        var counter = 0
        while tmp != 1 {
            if tmp % 2 == 0 {
                tmp /= 2
            } else {
                tmp = 3 * tmp + 1
            }
            counter += 1
        }
        return counter
    }
}
