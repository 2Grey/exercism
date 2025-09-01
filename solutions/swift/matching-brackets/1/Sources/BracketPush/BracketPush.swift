func paired(text: String) -> Bool {
    let input = text.filter({ "[](){}".contains($0) })

    var stack: [Character] = []
    let brackets: [Character: Character] = [ "}": "{", ")": "(", "]": "["]
    let open = "({["

    for char in input {
        if open.contains(char) {
            stack.append(char)
        } else {
            guard stack.isEmpty == false else { return false }
            guard let last = stack.last, last == brackets[char] else { return false }
            stack.removeLast()
        }
    }

    return stack.isEmpty
}
