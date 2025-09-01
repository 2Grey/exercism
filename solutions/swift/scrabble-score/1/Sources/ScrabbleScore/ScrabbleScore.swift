class Scrabble {
    static private let values = [
        1: ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        2: ["D", "G"],
        3: ["B", "C", "M", "P"],
        4: ["F", "H", "V", "W", "Y"],
        5: ["K"],
        8: ["J", "X"],
        10: ["Q", "Z"]
    ]

    static func score(_ input: String) -> Int {
        Scrabble(input).score
    }

    let score: Int

    init(_ input: String?) {
        if let input = input {
            self.score = input.map ({ Scrabble.score(for: $0) }).reduce(0, +)
        } else {
            self.score = 0
        }
    }

    static private func score(for letter: Character) -> Int {
        Scrabble.values.filter({ $0.value.contains(letter.uppercased()) }).first?.key ?? 0
    }
}
