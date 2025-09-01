struct ETL {
    static func transform(_ old: [Int: [String]]) -> [String: Int] {
        var result: [String: Int] = [:]
        for dict in old {
            for value in dict.value.map({ $0.lowercased()}) {
                result[value] = dict.key
            }
        }
        return result
    }
}
