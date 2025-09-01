class Pair: CustomStringConvertible {
    var char: Character
    var count: Int

    init(char: Character, count: Int = 1) {
        self.char = char
        self.count = count
    }

    var description: String {
        guard count > 1 else { return String(char) }
        return "\(count)\(char)"
    }

    var result: String {
        String(repeating: self.char, count: self.count)
    }
}

struct RunLengthEncoding {

    static func encode( _ input: String) -> String {
        var pairs: [Pair] = []
        var input = input

        while input.isEmpty == false {
            let char = input.removeFirst()

            if let pair = pairs.last, pair.char == char {
                pair.count += 1
            } else {
                pairs.append(Pair(char: char))
            }
        }

        return pairs.map({ $0.description }).joined()
    }

    static func decode(_ input: String) -> String {
        var pairs: [Pair] = []
        var input = input

        var number = ""

        while input.isEmpty == false {
            let char = input.removeFirst()

            if char.isNumber {
                number += String(char)
            } else {
                let count = Int(number) ?? 1
                let pair = Pair(char: char, count: count)
                pairs.append(pair)
                number = ""
            }
        }
        return pairs.map({ $0.result }).joined()
    }
}
