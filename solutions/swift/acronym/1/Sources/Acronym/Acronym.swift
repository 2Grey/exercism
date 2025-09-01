import Foundation
struct Acronym {

    static func abbreviate(_ input: String) -> String {
        var result: [String] = []

        input.enumerateSubstrings(in: input.startIndex..<input.endIndex, options: .byWords) { sub, _, _, _ in
            var hasLower = false
            for (idx, char) in (sub ?? "").enumerated() {
                if idx == 0 {
                    result.append(String(char))
                } else {
                    if char.isLower {
                        hasLower = true
                    } else if hasLower {
                        result.append(String(char))
                        hasLower = false
                    }
                }
            }
        }

        return result.joined().uppercased()
    }
}

extension Character {

    var isLower: Bool {
        return String(self) == self.lowercased()
    }
}
