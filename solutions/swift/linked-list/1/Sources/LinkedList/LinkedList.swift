class Deque<T> {
    private var arary: [T] = []
    func push(_ value: T) { self.arary.append(value) }
    func pop() -> T? { self.arary.removeLast() }
    func unshift(_ value: T) { self.arary.insert(value, at: 0) }
    func shift() -> T? { self.arary.removeFirst() }
}
