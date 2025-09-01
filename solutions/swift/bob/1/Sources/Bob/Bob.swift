import  Foundation

final class Bob {
    class func hey(_ input: String) -> String {
        if input.trimmingCharacters(in: .whitespaces).isEmpty == true {
            return "Fine. Be that way!"
        } else if input.isYell() {
            return "Whoa, chill out!"
        } else if input.last == "?" {
            return "Sure."
        }
        return "Whatever."
    }
}

extension String {
    func isYell() -> Bool {
        let v = self.trimmingCharacters(in: CharacterSet.letters.inverted.union(CharacterSet.whitespacesAndNewlines))
        if v.isEmpty {
            return false
        }
        return v.uppercased() == v
    }
}

