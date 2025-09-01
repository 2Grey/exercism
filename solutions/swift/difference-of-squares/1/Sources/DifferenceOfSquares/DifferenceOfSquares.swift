import Foundation

final class Squares {

    private let value: Int

    init(_ value: Int) {
        self.value = value
    }

    var squareOfSum: Decimal {
        pow(Decimal(self.sum()), 2)
    }

    var sumOfSquares: Decimal {
        Array(1...self.value).reduce(Decimal(0)) { $0 + Decimal($1 * $1) }
    }

    var differenceOfSquares: Decimal {
        abs(self.squareOfSum - self.sumOfSquares)
    }

    private func sum() -> Int {
        (self.value * (self.value + 1)) / 2
    }
}
