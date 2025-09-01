extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
}

func encode(_ value: String, rails: Int) -> String {
    return matrix(rails, value.count)
        .map({ String(value[$0.1]) })
        .joined()
}

func decode(_ value: String, rails: Int) -> String {
    return matrix(rails, value.count)
        .enumerated()
        .sorted(by: { $0.1.1 < $1.1.1 })
        .map({ String(value[$0.offset]) })
        .joined()
}

func matrix(_ rails: Int, _ textLen: Int) -> [(Int, Int)] {
    var result = [Int]()
    var current = 0
    var goingDown = true

    for _ in 0..<textLen {
        result.append(current)
        if goingDown {
            if current + 1 < rails {
                current += 1
            } else {
                goingDown = false
                current -= 1
            }
        } else {
            if current > 0 {
                current -= 1
            } else {
                goingDown = true
                current += 1
            }
        }
    }

    return zip(result, 0..<textLen).sorted(by: { $0.0 < $1.0 })
}
