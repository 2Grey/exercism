import Foundation
struct Isogram {
    static func isIsogram(_ input: String) -> Bool {
        let raw = (input as NSString)
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: " ", with: "")

        var count: [String: Int] = [:]
        for ch in raw.map({ $0.lowercased() }) {
            count[ch, default: 0] += 1
        }
        return count.allSatisfy({ $0.value == 1 })
    }
}
