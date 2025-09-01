struct PigLatin {
    static var vowels: [String] = ["a", "e", "i", "o", "u"]
    static var consonants: [String] = ["ch", "qu", "squ", "thr", "th", "sch", "y", "x"]

    static func translate(_ input: String) -> String {
        var result = input

        let first = input.first ?? Character("")
        if vowels.contains(String(first)) {
             result += "ay"
        } else if let consonant = PigLatin.consonant(in: input) {
            result.removeFirst(consonant.count)
            result += consonant + "ay"
        }
        return result
    }

    private static func consonant(in input: String) -> String? {
        for consonant in consonants {
            if input.hasPrefix(consonant) {
                return consonant
            }
        }
        return nil
    }
}

//Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
//Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.
