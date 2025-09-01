struct Sieve {

    let primes: [Int]

    init(_ limit: Int) {
        var primes = Array(2...limit)

        var upper: Int = 1
        while let tmp = Sieve.getPrime(from: primes, upper: upper) {
            guard tmp * tmp < limit else { break }
            upper = tmp
            primes = Sieve.remove(tmp, from: primes)
        }

        self.primes = primes
    }

    private static func getPrime(from: [Int], upper: Int?) -> Int? {
        return from.first(where: { $0 > (upper ?? 2) && $0.isPrime })
    }

    private static func remove(_ number: Int, from: [Int]) -> [Int] {
        var input = from
        for value in from where value != number {
            if value % number == 0 {
                input.removeAll(where: { $0 == value })
            }
        }
        return input
    }
}

extension Int {

    var isPrime: Bool {
        if self == 2 { return true }
        if self == 3 { return true }
        guard self > 3 else { return false }
        for i in 2...self / 2 {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}
