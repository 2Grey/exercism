import Foundation

final class Gigasecond: CustomStringConvertible {

    static let gigasecond: TimeInterval = 1_000_000_000

    private static var df: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        df.timeZone = TimeZone(secondsFromGMT: 0)
        return df
    }()

    private let birthDay: Date

    init?(from date: String) {
        guard let birthDay = Gigasecond.df.date(from: date) else { return nil }
        self.birthDay = birthDay
    }

    var description: String {
        return Gigasecond.df.string(from: self.birthDay.addingTimeInterval(Gigasecond.gigasecond))
    }
}
