struct Stone: Equatable {
    let left: Int
    let right: Int

    init(_ input: (Int, Int)) {
        self.left = input.0
        self.right = input.1
    }

    func change() -> Stone {
        return Stone((self.right, self.left))
    }

    static func == (lhs: Stone, rhs: Stone) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right || lhs.left == rhs.right && lhs.right == rhs.left
    }
}

struct Chain {
    var remainingStones: [Stone]
    var chainedStones: [Stone]

    init(_ stones: [Stone]) {
        self.remainingStones = Array(stones.dropFirst())
        self.chainedStones = [ stones.first! ]
    }

    mutating func run() -> Bool {
        guard self.remainingStones.isEmpty == false else { return true }
        for stone in self.remainingStones where self.chainedStones.last?.right == stone.left || self.chainedStones.last?.right == stone.right {
            if self.chainedStones.last?.right == stone.left {
                self.chainedStones.append(stone)
            } else {
                self.chainedStones.append(stone.change())
            }

            if let idx = self.remainingStones.index(of: stone) {
                self.remainingStones.remove(at: idx)
            }

            if self.run() { return true }

            self.chainedStones.removeLast()
            self.remainingStones.append(stone)
        }
        return false
    }
}

final class Dominoes {
    let stones: [Stone]

    init(_ input: [(Int, Int)]) {
        self.stones = input.map(Stone.init)
    }

    var chained: Bool {
        guard self.stones.isEmpty == false else { return false }
        var chain = Chain(self.stones)
        guard chain.run(), chain.chainedStones.first?.left == chain.chainedStones.last?.right else { return false }
        return true
    }
}
