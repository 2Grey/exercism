import Foundation

extension Collection {
    func accumulate<T>(_ executor: (Element) -> T) -> [T] {
        var result: [T] = []
        for element in self {
            result.append(executor(element))
        }
        return result
    }
}
