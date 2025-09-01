import Foundation
struct WordCount {
    let words: String
    func count() -> [String: Int] {
        var result: [String: Int] = [:]
        self.words.enumerateSubstrings(in: self.words.startIndex..<self.words.endIndex, options: .byWords, { substring, _, _, _ in
            guard let sub = substring?.lowercased() else { return }
            result[sub] = (result[sub] ?? 0) + 1
        })
        return result
    }
}
