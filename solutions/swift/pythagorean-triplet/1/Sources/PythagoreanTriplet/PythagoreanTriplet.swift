class Triplet {

    let sum: Int
    let isPythagorean: Bool
    let product: Int

    init(_ a: Int, _ b: Int, _ c: Int) {
        self.sum = a + b + c
        self.product = a * b * c
        self.isPythagorean = a * a + b * b == c * c
    }

    static func fromWhere(_ start: Int = 1, maxFactor: Int, sum: Int? = nil) -> [Triplet] {
        var result: [Triplet] = []

        for a in start...maxFactor {
            for b in a...maxFactor {
                for c in b...maxFactor {
                    let triplet = Triplet(a, b, c)
                    if triplet.isPythagorean {
                        result.append(triplet)
                    }
                }
            }
        }

        guard let iSum = sum else { return result }
        return result.filter({ $0.sum == iSum })
    }
}
