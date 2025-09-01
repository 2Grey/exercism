struct Prime {
    static func nth(_ idx: Int) -> Int? {
        guard idx > 0 else { return nil }

        var values: [Int] = []
        var current = 2
        while values.count < idx {
            if current.isPrime {
                values.append(current)
            }
            current += 1
        }
        return values.last
    }
}

extension Int {

    var isPrime: Bool {
        if self <= 1 { return false }
        if self <= 3 { return true }
        var i = 2

        while i * i <= self {
            if self % i == 0 { return false }
            i += 1
        }
        return true
    }
}
