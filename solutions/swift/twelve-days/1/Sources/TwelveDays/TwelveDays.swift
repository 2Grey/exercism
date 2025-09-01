import Foundation

struct TwelveDaysSong {

    static let numerals = [ "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" ]
    static let numbers = [ "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve" ]
    static let events = [ "Drummers Drumming", "Pipers Piping", "Lords-a-Leaping", "Ladies Dancing", "Maids-a-Milking", "Swans-a-Swimming", "Geese-a-Laying", "Gold Rings", "Calling Birds", "French Hens", "Turtle Doves"]

    // MARK: - Song
    
    static func sing() -> String {
        self.verses(1, 12)
    }

    static func verses(_ from: Int, _ to: Int) -> String {
        (from...to).map({ self.verse($0) }).joined(separator: "\n")
    }

    static func verse(_ lines: Int) -> String {
        let firstLine = "On the \(numerals[lines - 1]) day of Christmas my true love gave to me:"
        var lastLine = "\( lines != 1 ? "and " : "" )a Partridge in a Pear Tree."

        var result: [String] = []
        if lines > 1 {
            for idx in (1..<lines).reversed() {
                let line = "\(numbers[idx - 1]) \(events[events.count - idx])"
                result.append(line)
            }
        }

        if lines != 1 {
            lastLine = result.joined(separator: ", ") + ", " + lastLine
        }

        return firstLine + " " + lastLine
    }
}
