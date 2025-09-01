import Foundation

struct IsbnVerifier {

    static func isValid(_ code: String) -> Bool {
        let input = (code as NSString).replacingOccurrences(of: "-", with: "")
        guard input.count == 10 else { return false }

        var sums:[Int] = []
        for (idx, char) in input.enumerated() {
            let v: Int
            if char.lowercased() == "x" {
                if idx == input.count - 1 {
                    v = 10
                } else {
                    return false
                }
            } else {
                v = Int(String(char)) ?? 0
            }
            sums.append(v * (10 - idx))
        }
        return sums.reduce(0, +) % 11 == 0
    }
}
