
struct Anagram {
    let word: String

    func match(_ values: [String]) -> [String] {
        return values.filter({ self.checkAnagram(for: $0) })
    }

    private func checkAnagram(for value: String) -> Bool {
        var base = self.word.lowercased()
        let lower = value.lowercased()

        guard lower != base else { return false }

        for val in lower {
            if let idx = base.firstIndex(of: val) {
                base.remove(at: idx)
            } else {
                return false
            }
        }

        return base.isEmpty
    }
}
