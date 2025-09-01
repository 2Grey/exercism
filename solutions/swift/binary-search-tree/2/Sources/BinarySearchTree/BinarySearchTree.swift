class BinarySearchTree {

    let data: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?

    init(_ data: Int) {
        self.data = data
    }

    @discardableResult
    func insert(_ value: Int) -> BinarySearchTree {
        if value <= self.data {
            self.left = self.left != nil ? left?.insert(value) : BinarySearchTree(value)
        } else {
            self.right = self.right != nil ? right?.insert(value) : BinarySearchTree(value)
        }
        return self
    }

    func allData() -> [Int] {
        var result: [Int] = [self.data]
        result.append(contentsOf: self.left?.allData() ?? [])
        result.append(contentsOf: self.right?.allData() ?? [])
        return result.sorted()
    }
}
