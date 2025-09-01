struct Value: Comparable {
    var value: Int {
        return factor.reduce(1, *)
    }

    let factor: [Int]

    static func < (lhs: Value, rhs: Value) -> Bool {
        if lhs.value == rhs.value {
            if lhs.factor.first! == rhs.factor.first! {
                guard let lLow = lhs.factor.last, let rLow = lhs.factor.last else { return false }
                return lLow == rLow
            } else {
                return lhs.factor.first! < rhs.factor.first!
            }
        } else {
            return lhs.value < rhs.value
        }
    }

}

class PalindromeProducts {

    var largest: Value
    var smallest: Value

    var values: [Value] = []

    init(maxFactor: Int, minFactor: Int = 1) {
        for lhs in minFactor...maxFactor {
            for rhs in lhs...maxFactor {
                let mult = lhs * rhs
                if mult.isPalindrom {
                    self.values.append(Value(factor: [lhs, rhs]))
                }
            }
        }

        let sorted = self.values.sorted()
        self.smallest = sorted.first ?? Value(factor: [0])
        self.largest = sorted.last ?? Value(factor: [0])
    }
}

extension Int {
    var isPalindrom: Bool {
        var input = String(self)
        while input.isEmpty == false {
            if input.last == input.first {
                input.removeFirst()
                if input.isEmpty == false {
                    input.removeLast()
                }
            } else {
                return false
            }
        }
        return true
    }
}
