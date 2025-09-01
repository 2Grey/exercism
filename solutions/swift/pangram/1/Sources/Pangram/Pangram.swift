import Foundation
struct Pangram {

    static func isPangram(_ input: String) -> Bool {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz").map({ String($0) })

        var mySet = Set<String>()

        for char in input where char.isLetter{
            mySet.insert(char.lowercased())
        }
        return alphabet.sorted() == Array(mySet).sorted()
    }
}
