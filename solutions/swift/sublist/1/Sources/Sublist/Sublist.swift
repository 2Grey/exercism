enum Result {
    case equal
    case sublist
    case superlist
    case unequal
}

func classifier(listOne: [Int], listTwo: [Int]) -> Result {
    let lhs = Set(listOne)
    let rhs = Set(listTwo)

    if lhs == rhs { return .equal }
    if lhs.isSubset(of: rhs) { return .sublist }
    if lhs.isSuperset(of: rhs) { return .superlist }
    return .unequal
}

//Given two lists determine
//if the first list is contained within the second list,
//if the second list is contained within the first list,
//if both lists are contained within each other or if none of these are true.
//
//Specifically, a list A is a sublist of list B if by dropping 0 or more elements from the front of B and 0 or more elements from the back of B you get a list that's completely equal to A.
