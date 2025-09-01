import Foundation

class PhoneNumber: CustomStringConvertible {
    static let defaultNumber = "0000000000"
    static let defaultAreaCode = "000"

    private(set) var number: String!
    private(set) var areaCode: String!

    init(_ input: String) {
        var clean = input.trimmingCharacters(in: CharacterSet(charactersIn: "-(). "))
        if clean.hasPrefix("1") {
            clean = String(clean.dropFirst())
        }

        if clean.count == 10 {
            self.number = clean
            self.areaCode = String(clean[clean.startIndex..<clean.index(clean.startIndex, offsetBy: 3)])
        } else {
            self.number = PhoneNumber.defaultNumber
            self.areaCode = PhoneNumber.defaultAreaCode
        }
    }

    // MARK: - CustomStringConvertible

    var description: String {
        let number = self.number!
        let areaEndIndex = number.index(number.startIndex, offsetBy: 3)
        let area = number[..<areaEndIndex]

        let lhsEndIndex = number.index(areaEndIndex, offsetBy: 3)
        let lhs = number[areaEndIndex..<lhsEndIndex]

        let rhs = number[lhsEndIndex..<number.endIndex]
        return "(\(area)) \(lhs)-\(rhs)"
    }
}
