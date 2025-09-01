import Foundation

final class Allergies {
    struct Allergy: OptionSet {
        let rawValue: UInt

        static let eggs         = Allergy(rawValue: 1 << 0)
        static let peanuts      = Allergy(rawValue: 1 << 1)
        static let shellfish    = Allergy(rawValue: 1 << 2)
        static let strawberries = Allergy(rawValue: 1 << 3)
        static let tomatoes     = Allergy(rawValue: 1 << 4)
        static let chocolate    = Allergy(rawValue: 1 << 5)
        static let pollen       = Allergy(rawValue: 1 << 6)
        static let cats         = Allergy(rawValue: 1 << 7)
    }

    private let allergy: Allergy

    init(_ code: UInt) {
        self.allergy = Allergy(rawValue: code)
    }

    func hasAllergy(_ allergy: Allergy) -> Bool {
        return self.allergy.contains(allergy)
    }
}
