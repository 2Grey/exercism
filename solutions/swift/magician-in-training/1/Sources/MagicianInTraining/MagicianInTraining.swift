func getCard(at index: Int, from stack: [Int]) -> Int {
    return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
    guard index >= 0, index < stack.count else { return stack }
    var result = stack
    result.replaceSubrange(index..<index + 1, with: [newCard])
    return result
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
    var result = stack
    result.append(newCard)
    return result
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
    guard index >= 0, index < stack.count else { return stack }
    var result = stack
    result.remove(at: index)
    return result
}

func removeTopCard(_ stack: [Int]) -> [Int] {
    guard !stack.isEmpty else { return [] }
    var result = stack
    result.removeLast()
    return result
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
    var result = stack
    result.insert(newCard, at: 0)
    return result
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
    var result = stack
    result.removeFirst()
    return result
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
    return stack.count == size
}

func evenCardCount(_ stack: [Int]) -> Int {
    return stack.filter({ $0 % 2 == 0 }).count
}
