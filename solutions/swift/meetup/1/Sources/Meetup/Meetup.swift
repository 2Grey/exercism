import Foundation

struct ResultDate: CustomStringConvertible {
    let year: Int
    let month: Int
    let day: Int

    var description: String {
        String(format: "%d-%02d-%02d", self.year, self.month, self.day)
    }
}

struct Meetup {
    enum WhichOptions: String {
        case first  = "1st"
        case second = "2nd"
        case third  = "3rd"
        case fourth = "4th"
        case last   = "last"
        case teenth = "teenth"
    }

    let year: Int
    let month: Int

    func day(_ dayOfWeek: Int, which: String) -> ResultDate {
        let whichValue = WhichOptions(rawValue: which) ?? WhichOptions.first

        let calendar = Calendar.current

        var results: [Int] = []

        let firstDay = calendar.date(from: DateComponents(calendar: calendar,
                                                          year: self.year,
                                                          month: self.month,
                                                          day: 0))!

        calendar.enumerateDates(startingAfter: firstDay,
                                matching: DateComponents(hour: 0, minute: 0, second: 0),
                                matchingPolicy: .nextTime) { date, strict, isStop in
            if let date = date {
                let dc = calendar.dateComponents([.month, .day, .weekday], from: date)
                if dc.month == self.month {
                    if dc.weekday == dayOfWeek {
                        results.append(dc.day!)
                    }
                } else {
                    isStop = true
                }
            } else {
                isStop = true
            }
        }

        let day = Meetup.pick(from: results, which: whichValue)
        return ResultDate(year: self.year, month: self.month, day: day)

    }

    private static func pick(from: [Int], which: WhichOptions) -> Int {
        switch which {
        case .first:    return from[0]
        case .second:   return from[1]
        case .third:    return from[2]
        case .fourth:   return from[3]
        case .last:     return from.last!
        case .teenth:   return from.first(where: { (13...19).contains($0) })!
        }
    }
}
