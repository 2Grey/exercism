func flattenArray<T>(_ list: [Any]) -> [T] {
    var result: [T] = []
    for value in list {
        if let i = value as? T {
            result.append(i)
        } else if let a = value as? [Any] {
            result.append(contentsOf: flattenArray(a))
        }
    }
    return result
}
