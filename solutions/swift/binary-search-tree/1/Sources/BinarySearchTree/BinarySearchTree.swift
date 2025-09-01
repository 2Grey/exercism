class BinarySearchTree {

    let data: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?

    init(_ data: Int) {
        self.data = data
    }

    func insert(_ value: Int) {
        if value <= self.data {
            if case nil = self.left?.insert(value) {
                self.left = BinarySearchTree(value)
            }
        } else {
            if case nil = self.right?.insert(value) {
                self.right = BinarySearchTree(value)
            }
        }
    }

    func allData() -> [Int] {
        var result: [Int] = [self.data]
        result.append(contentsOf: self.left?.allData() ?? [])
        result.append(contentsOf: self.right?.allData() ?? [])
        return result.sorted()
    }
}
