// MARK: - PokerHand

struct PokerHand {
    init?(_ hand: String) {
        guard Poker.bestHand([hand]) != nil else { return nil }
    }
}

// MARK: - Poker

class Poker {
    enum Combinations: Comparable {
        case high(Int)
        case pair(Int, Int, Int, Int)
        case twoPair(Int, Int, Int)
        case three(Int)
        case straight(Int)
        case flush(Int, Int, Int, Int, Int)
        case fullHouse(Int, Int)
        case four(Int)
        case straightFlush(Int)
        case royalFlush
    }

    private class Hand: CustomStringConvertible {
        enum HandError: Error {
            case invalidCount
            case invalidCard
            case invalidSuit
            case invalidRank
        }

        struct Card: CustomStringConvertible {
            static let Ace = 14
            static let King = 13
            static let Queen = 12
            static let Jack = 11

            enum Suit: String {
                case spades = "♤"
                case hearts = "♡"
                case clubs = "♧"
                case diamonds = "♢"
            }

            let rank: Int
            let suit: Suit

            init(_ raw: String) throws {
                var input = raw
                let rawSuit = String(input.removeLast())
                guard let suit = Suit(rawValue: rawSuit) else { throw HandError.invalidSuit }
                self.suit = suit

                guard let rank = Card.parseRank(input), rank >= 2, rank <= 14 else { throw HandError.invalidRank }
                self.rank = rank
            }

            private static func parseRank(_ raw: String) -> Int? {
                if raw == "A" { return Ace }
                if raw == "K" { return King }
                if raw == "Q" { return Queen }
                if raw == "J" { return Jack }
                return Int(raw)
            }

            private static func toRank(_ value: Int) -> String {
                if value == Ace { return "A" }
                if value == King { return "K" }
                if value == Queen { return "Q" }
                if value == Jack { return "J" }
                return "\(value)"
            }

            var description: String {
                "\(Card.toRank(self.rank))\(suit.rawValue)"
            }
        }

        let cards: [Card]
        let combination: Combinations

        init(_ raw: String) throws {
            let split = raw.split(separator: " ")
            guard split.count == 5 else { throw HandError.invalidCount }

            self.cards = try split.map { try Card(String($0)) }
            self.combination = Hand.detectCombination(for: self.cards)
        }

        class func detectCombination(for cards: [Card]) -> Combinations {
            let suitGroup = Dictionary(grouping: cards, by: \.suit)
            let rankGroup = Dictionary(grouping: cards, by: \.rank)

            let straightHigh = self.straightHigh(for: cards)
            let isFlush = suitGroup.filter { $0.value.count == 5 }.count > 0

            if isFlush, straightHigh == Card.Ace { return Combinations.royalFlush }
            if isFlush, let sh = straightHigh, sh != Card.Ace { return Combinations.straightFlush(sh) }
            if let four = rankGroup.first(where: { $0.value.count == 4 })?.key { return Combinations.four(four) }

            if let three = rankGroup.first(where: { $0.value.count == 3 })?.key,
               let two = rankGroup.first(where: { $0.value.count == 2 })?.key
            {
                return Combinations.fullHouse(three, two)
            }

            if isFlush {
                let sorted = cards.sorted(by: { $0.rank > $1.rank }).compactMap({ $0.rank })
                return Combinations.flush(sorted[0], sorted[1], sorted[2], sorted[3], sorted[4])
            }
            if let sh = straightHigh { return Combinations.straight(sh) }

            if let three = rankGroup.first(where: { $0.value.count == 3})?.key {
                return Combinations.three(three)
            }

            let pairs = rankGroup.filter({ $0.value.count == 2})
            let high = self.remove(from: cards, ranks: pairs.map({ $0.key }))
            if pairs.count == 2 {
                let sorted = pairs.sorted(by: { $0.key > $1.key })
                return Combinations.twoPair(sorted[0].key, sorted[1].key, high.last!.rank)
            } else if pairs.count == 1 {
                return Combinations.pair(pairs.first!.key, high[0].rank, high[1].rank, high[2].rank)
            }

            return Combinations.high(cards.sorted(by: { $0.rank > $1.rank }).first!.rank)
        }

        class func straightHigh(for cards: [Card]) -> Int? {
            var sorted = cards.map { $0.rank }.sorted()
            if sorted.last == Card.Ace {
                sorted.insert(1, at: 0)
            }

            var tmp = sorted.first!
            var count = 0
            for idx in 1 ..< sorted.count {
                let val = sorted[idx]
                if tmp + 1 == val {
                    count += 1
                }
                tmp = val
            }
            guard count == 4 else { return nil }
            return sorted.last
        }

        var description: String {
            self.cards.map { $0.description }.joined(separator: " ")
        }

        class func remove(from: [Card], ranks: [Int]) -> [Card] {
            return from.filter({ !ranks.contains($0.rank) }).sorted(by: { $0.rank > $1.rank })
        }
    }

    class func bestHand(_ rawHands: [String]) -> String? {
        guard let hands = try? rawHands
            .map({ try Hand($0) })
                .sorted(by: { ($0.combination) > ($1.combination) })
        else {
            return nil
        }

        return hands.first?.description
    }
}
