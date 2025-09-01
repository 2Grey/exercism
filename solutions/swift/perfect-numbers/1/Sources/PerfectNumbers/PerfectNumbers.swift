struct NumberClassifier {
    enum Classification {
        case perfect
        case abundant
        case deficient
    }
    let number: Int

    var classification: Classification {
        let sum = factors(of: number).dropLast().reduce(0, +)
        if sum == number { return .perfect }
        if sum > number { return .abundant }
        return .deficient
    }

    private func factors(of n: Int) -> [Int] {
        let sqrtn = Int(Double(n).squareRoot())
        var factors: [Int] = []
        factors.reserveCapacity(2 * sqrtn)
        for i in 1...sqrtn where n % i == 0 {
            factors.append(i)
        }
        var j = factors.count - 1
        if factors[j] * factors[j] == n {
            j -= 1
        }
        while j >= 0 {
            factors.append(n / factors[j])
            j -= 1
        }
        return factors
    }
}
