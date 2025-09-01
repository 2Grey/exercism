struct PigLatin {
    static let ending = "ay"

    static func translate(_ input: String) -> String {
        input.split(separator: " ").map { internalTranslate(String($0)) }.joined(separator: " ")
    }

    static func internalTranslate(_ input: String) -> String {
        for c in ["yt", "xr"] where input.hasPrefix(c) { return input + PigLatin.ending }

        var result = input
        for l in input {
            if !l.isVowel || l == "u" && result.hasSuffix("q") {
                result = result.dropFirst() + String(l)
            } else {
                break
            }
        }
        result += PigLatin.ending
        return result
    }
}

extension Character {
    var isVowel: Bool {
        return ["a", "e", "i", "o", "u"].contains(self.lowercased())
    }
}
