import Foundation

enum ResistorColor {

    static let colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

    static func colorCode(for code: String) -> Int {
        colors.firstIndex(of: code.lowercased())!
    }
}
