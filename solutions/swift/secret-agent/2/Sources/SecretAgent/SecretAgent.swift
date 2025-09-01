func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
    var result: [Int] = []
    var tmp = room
    for _ in 0..<3 {
        tmp = f(tmp)
        result.append(tmp)
    }
    return (result[0], result[1], result[2])
}

func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
    func f(_ iPassword: String) -> String {
        return password == iPassword ? secret : "Sorry. No hidden secrets here."
    }
    return f 
}
