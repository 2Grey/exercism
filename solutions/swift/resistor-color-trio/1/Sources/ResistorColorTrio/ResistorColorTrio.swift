import Foundation

enum ResistorColorTrio {

    private static let colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
    private static let prefixes = ["", "kilo", "mega", "giga"]

    static func label(for codes: [String]) -> String {
        let values = codes.map { colors.firstIndex(of: $0)! }
        var value = (10 * values[0] + values[1]) * Int(pow(10, Double(values[2])))
        var prefix = 0
        while value >= 1000 {
            value /= 1000
            prefix += 1
        }
        return "\(value) \(prefixes[prefix])ohms"
    }
}
