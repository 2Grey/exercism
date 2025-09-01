import Foundation
final class Clock: Equatable, CustomStringConvertible {

    private var date: Date!

    init(hours: Int, minutes: Int = 0) {
        var h: Int

        if hours < 0 {
            h = (24 + hours % 24) % 24
        } else {
            h = hours % 24
        }

        self.date = Clock.createTime(hour: h, min: minutes)!
    }

    func add(minutes: Int) -> Self {
        self.date = Calendar.current.date(byAdding: .minute, value: minutes, to: self.date)
        return self
    }

    func subtract(minutes: Int) -> Self {
        self.date = Calendar.current.date(byAdding: .minute, value: -minutes, to: self.date)
        return self
    }

    // MARK: - Equatable

    static func ==(lhs: Clock, rhs: Clock) -> Bool {
        let lhsSplit = Clock.split(date: lhs.date)
        let rhsSplit = Clock.split(date: rhs.date)
        return lhsSplit.0 == rhsSplit.0 && lhsSplit.1 == rhsSplit.1
    }

    // MARK: - CustomStringConvertible

    var description: String {
        let split = Clock.split(date: self.date)
        return String(format: "%02d:%02d", split.0, split.1)
    }

    // MARK: - Helpers

    private static func split(date: Date) -> (Int, Int) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        return (components.hour!, components.minute!)
    }

    static func createTime(hour: Int, min: Int) -> Date? {
        let x: Set<Calendar.Component> = [.hour, .minute]
        let cal = Calendar.current
        var components = cal.dateComponents(x, from: Date())

        components.hour = hour
        components.minute = min

        return cal.date(from: components)
    }
}
