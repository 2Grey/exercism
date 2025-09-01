import Foundation

enum ResistorColorDuo {

    private static let colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

    static func value(for codes: [String]) -> Int {
        guard codes.isEmpty == false else { return 0 }
        let firstCodeValue = colors.firstIndex(of: codes[0].lowercased())!
        if codes.count > 1 {
            let secondCodeValue = colors.firstIndex(of: codes[1].lowercased())!
            return 10 * firstCodeValue + secondCodeValue
        } else {
            return firstCodeValue
        }
    }
}


