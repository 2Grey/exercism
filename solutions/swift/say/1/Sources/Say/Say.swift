let sNum = [ "", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" , "ten", "eleven"
             , "twelve", "thirteen", "fourteen", "fifteen", "sixteen" , "seventeen", "eighteen", "nineteen" ]
let sTens = [ "", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety" ]
let sMult = [ "", " thousand", " million", " billion" ]


func say(_ value: Int) -> String? {
    guard value != 0 else { return "zero" }
    guard value > 0, value < 1_000_000_000_000 else { return nil }

    var result: [String] = []
    for (idx, val) in split(value).enumerated() {
        guard val != 0 else { continue }
        result.append(text(from: val) + sMult[3 - idx])
    }
    return result.joined(separator: " ")
}

private func split(_ value: Int) -> [Int] {
    func small(diff: Int) -> Int {
        return value / diff % 1000
    }

    return [
        small(diff: 1_000_000_000),
        small(diff: 1_000_000),
        small(diff: 1_000),
        small(diff: 1),
    ]
}

private func text(from value: Int) -> String {
    let hundreds = value / 100
    let dozens = (value % 100) / 10
    let one = (value % 100) % 10

    var result: [String] = []

    if hundreds > 0 {
        var h = sNum[hundreds] + " hundred"
        if value % 100 != 0 {
            h += " "
        }
        result.append(h)
    }

    if dozens >= 2 {
        var t = sTens[dozens]
        if one != 0 {
            t += "-" + sNum[one]
        }
        result.append(t)
    } else {
        result.append(sNum[dozens * 10 + one])
    }

    return result.joined()
}
