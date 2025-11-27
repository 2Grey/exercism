
func score(_ scores: [Int], category: YachtCategory) -> Int {
    switch category {
    case .ones:
        return scores.count { $0 == 1 }
    case .twos:
        return 2 * scores.count { $0 == 2 }
    case .threes:
        return 3 * scores.count { $0 == 3 }
    case .fours:
        return 4 * scores.count { $0 == 4 }
    case .fives:
        return 5 * scores.count { $0 == 5 }
    case .sixes:
        return 6 * scores.count { $0 == 6 }
    case .fullHouse:
        let counts = scores.reduce(into: [:]) { $0[$1, default: 0] += 1}
        guard counts.values.contains(3) && counts.values.contains(2) else { break }
        return scores.reduce(0, +)
    case .fourOfAKind:
        let counts = scores.reduce(into: [:]) { $0[$1, default: 0] += 1}
        guard let pair = counts.first(where: { $0.value >= 4 }) else { break }
        return pair.key * 4
    case .littleStraight:
        guard scores.sorted() == [1, 2, 3, 4, 5] else { break }
        return 30
    case .bigStraight:
        guard scores.sorted() == [2, 3, 4, 5, 6] else { break }
        return 30
    case .choice:
        return scores.reduce(0, +)
    case .yacht:
        let first = scores.first!
        guard scores.allSatisfy({ $0 == first }) else { break }
        return 50
    }
    return 0
}
