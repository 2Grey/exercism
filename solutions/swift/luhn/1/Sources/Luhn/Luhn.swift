class Luhn {
    let isValid: Bool

    init(_ raw: String) {
        let input = raw.filter({ $0 != " " })
        guard input.allSatisfy({ $0.isNumber }) else {
            self.isValid = false
            return
        }

        if input.count > 1 {
            var sum: [Int] = []
            for (idx, char) in input.reversed().enumerated() {
                let int = Int(String(char))!
                if (idx + 1) % 2 == 0 {
                    let double = int * 2
                    if double > 9 {
                        sum.append(double - 9)
                    } else {
                        sum.append(double)
                    }
                } else {
                    sum.append(int)
                }
            }
            self.isValid = sum.reduce(0, +) % 10 == 0
        } else {
            self.isValid = false
        }
    }
}
