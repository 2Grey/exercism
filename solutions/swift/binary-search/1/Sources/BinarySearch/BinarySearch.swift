enum BinarySearchError: Error {
    case unsorted
}

class BinarySearch {

    let list: [Int]
    let middle: Int

    init(_ input: [Int]) throws {
        guard input == input.sorted() else { throw BinarySearchError.unsorted }
        self.list = input
        self.middle = input.count / 2
    }

    func searchFor(_ value: Int) -> Int? {
        self.list.firstIndex(of: value)
    }
}
