let kTotalPins = 10

protocol Framed {
    var first: Int { get set }
    var second: Int? { get set }
    var value: Int { get }

    var next: Framed? { get set }

    func addPins(_ pins: Int)

    var isDone: Bool { get }
    var isOverload: Bool { get }
}

class Frame: Framed {
    var first: Int
    var second: Int?

    var next: Framed?

    init(first: Int) {
        self.first = first
    }

    func addPins(_ pins: Int) {
        self.second = pins
    }

    // MARK: -

    private var sum: Int { return self.first + (self.second ?? 0) }
    private var isStrike: Bool { self.first == kTotalPins }
    private var isSpare: Bool { !self.isStrike && self.sum == kTotalPins }

    // MARK: -

    var value: Int {
        if self.isStrike {
            var result = 10
            if self.next?.first == 10 {
                if let last = self.next as? LastFrame {
                    result += last.first + (last.second ?? 0)
                } else {
                    result += (self.next?.first ?? 0) + (self.next?.next?.first ?? 0)
                }
            } else {
                result += (self.next?.first ?? 0) + (self.next?.second ?? 0)
            }
            return result
        } else if self.isSpare {
            return 10 + (self.next?.first ?? 0)
        }
        return self.sum
    }

    var isDone: Bool { return self.isStrike || self.second != nil }
    var isOverload: Bool { self.sum > kTotalPins }
}

class LastFrame: Framed {
    var first: Int
    var second: Int?
    var third: Int?

    var next: Framed? = nil

    init(first: Int) {
        self.first = first
    }

    func addPins(_ pins: Int) {
        if second == nil {
            self.second = pins
        } else {
            self.third = pins
        }
    }

     // MARK: -
    var value: Int {
        return self.first + (self.second ?? 0) + (self.third ?? 0)
    }

    var isDone: Bool {
        if self.first == 10, self.second == 10, self.third == 10 {
            return true
        } else if self.first == 10, self.second == 10, self.third != nil {
            return true
        } else if self.first == 10, self.second != nil, self.third != nil {
            return true
        } else if second != nil, self.third != nil {
            return true
        } else if let second = self.second, self.first + second < 10 {
            return true
        } else if self.first == 0, self.second == 0 {
            return true
        }
        return false
    }

    var isOverload: Bool {
        if self.first == 10 {
            return (self.second ?? 0) + (self.third ?? 0) > 10
        } else {
            return self.first + (self.second ?? 0) > 10
        }
    }
}

class Bowling {

    enum BowlingError: Error {
        case invalidNumberOfPins
        case tooManyPinsInFrame
        case gameInProgress
        case gameIsOver
    }

    private var frames: [Framed] = []

    func roll(pins: Int) throws {
        guard (0...10).contains(pins) else { throw BowlingError.invalidNumberOfPins }

        if let last = self.frames.last(where: { !$0.isDone }) {
            last.addPins(pins)
            guard !last.isOverload else {
                throw BowlingError.tooManyPinsInFrame
            }
        } else {
            guard self.frames.count < 10 else { throw BowlingError.gameIsOver }
            var frame: Framed
            if self.frames.count < 9 {
                frame = Frame(first: pins)
            } else {
                frame = LastFrame(first: pins)
            }
            if let last = self.frames.last as? Frame {
                last.next = frame
            }
            self.frames.append(frame)
        }
    }

    func score() throws -> Int {
        guard self.frames.count == 10, self.frames.last?.isDone == true else { throw BowlingError.gameInProgress }
        return self.frames.reduce(0, {$0 + $1.value })
    }
}

