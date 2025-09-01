struct RomanNumeral: LosslessStringConvertible {

    static let values = [
        (key: "I",  value: 1),
        (key: "IV", value: 4),
        (key: "V",  value: 5),
        (key: "IX", value: 9),
        (key: "X",  value: 10),
        (key: "XL", value: 40),
        (key: "L",  value: 50),
        (key: "XC", value: 90),
        (key: "C",  value: 100),
        (key: "CD", value: 400),
        (key: "D",  value: 500),
        (key: "CM", value: 900),
        (key: "M",  value: 1000),
    ]

    private let value: String

    init?(_ description: String) {
        self.value = ""
    }

    init(_ input: Int) {
        var result = ""
        var curentNumber = input

        while curentNumber > 0 {
            for val in RomanNumeral.values.reversed() {
                if curentNumber >= val.value {
                    result += val.key
                    curentNumber -= val.value
                    break
                }
            }
        }
        self.value = result
    }

    var description: String {
        self.value
    }
}
