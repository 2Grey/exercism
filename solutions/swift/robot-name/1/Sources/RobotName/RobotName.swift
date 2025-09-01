import Foundation
class Robot {
    private(set) var name = ""

    init() {
        self.generateName()
    }

    func resetName() {
        self.generateName()
    }

    private func generateName() {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        let numbers = "0123456789"
        let lCode = String((0..<2).map{ _ in letters.randomElement()! })
        let nCode = String((0..<3).map{ _ in numbers.randomElement()! })
        self.name = "\(lCode.uppercased())\(nCode)"
    }
}
