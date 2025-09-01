class PrimeFactors {

    let toArray: [Int]

    init(_ value: Int) {
        var result: [Int] = []

        var factor = 2
        var value = value

        while value != 1 {
            if value % factor == 0 {
                value = value / factor
                result.append(factor)
            } else {
                factor += 1
            }
        }

        self.toArray = result
    }
}
