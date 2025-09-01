import Foundation

struct Pangram {

    static func isPangram(_ input: String) -> Bool {
        let alphabet = Set("abcdefghijklmnopqrstuvwxyz")
        let mySet = Set(input.lowercased())
        return Set(alphabet).isSubset(of: mySet)
    }
}

