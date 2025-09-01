import Foundation
enum Result {
    case equal
    case sublist
    case superlist
    case unequal
}

func classifier(listOne: [Int], listTwo: [Int]) -> Result {
    let lhs = listOne.reduce(".") { $0 + String($1) + "." }
    let rhs = listTwo.reduce(".") { $0 + String($1) + "." }

    if lhs == rhs { return .equal }
    if lhs.contains(rhs) { return .superlist}
    if rhs.contains(lhs) { return .sublist }
    return .unequal
}
