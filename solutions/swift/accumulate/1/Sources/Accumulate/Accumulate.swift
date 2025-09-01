import Foundation

extension Collection {

    func accumulate(_ executor: (_ input: Element) -> Element) -> [Element] {
        var result: [Element] = []
        for element in self {
            result.append(executor(element))
        }
        return result
    }

    func accumulate(_ executor: (_ input: Element) -> [Element]) -> [[Element]] {
        var result: [[Element]] = []
        for element in self {
            result.append(executor(element))
        }
        return result
    }
}
