import Foundation

let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
func encode(_ input: String) -> String {
    var result = ""

    for char in input.lowercased().filter({$0 != " " && !$0.isPunctuation }) {
        if let idx = alphabet.index(of: char) {
            result.append(alphabet[alphabet.count - idx - 1])
        } else {
            result.append(char)
        }
        if result.trimSpaces().count % 5 == 0 {
            result.append(" ")
        }
    }
    return result.trimmingCharacters(in: CharacterSet.whitespaces)
}

extension String {
    func trimSpaces() -> String {
        return self.filter({$0 != " " })
    }
}
