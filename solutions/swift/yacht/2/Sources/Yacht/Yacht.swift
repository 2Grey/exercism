func score(_ scores: [Int], category: YachtCategory) -> Int {
    func count(_ value: Int) -> Int { scores.count { $0 == value } * value }
    switch category {
    case .ones: return count(1)
    case .twos: return count(2)
    case .threes: return count(3)
    case .fours: return count(4)
    case .fives: return count(5)
    case .sixes: return count(6)
    case .fullHouse:
        let counts = scores.reduce(into: [:]) { $0[$1, default: 0] += 1}
        if counts.values.contains(3) && counts.values.contains(2) { return scores.reduce(0, +) }
    case .fourOfAKind:
        let counts = scores.reduce(into: [:]) { $0[$1, default: 0] += 1}
        if let pair = counts.first(where: { $0.value >= 4 }) { return pair.key * 4 }
    case .littleStraight: if scores.sorted() == [1, 2, 3, 4, 5] { return 30 }
    case .bigStraight: if scores.sorted() == [2, 3, 4, 5, 6] { return 30 }
    case .choice: return scores.reduce(0, +)
    case .yacht: if Set(scores).count == 1 { return 50}
    }
    return 0
}
