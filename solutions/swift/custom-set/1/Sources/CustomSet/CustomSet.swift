class CustomSet<T: Comparable>: Equatable {

    private(set) var set: [T] = []

    var size: Int {
        return self.set.count
    }

    var toSortedArray: [T] {
        return self.set.sorted()
    }

    init(_ input: [T]) {
        var result: [T] = []
        for val in input where !result.contains(val){
            result.append(val)
        }
        self.set = result
    }

    // MARK: -

    func put(_ value: T) {
        guard !self.containsMember(value) else { return }
        self.set.append(value)
    }

    func delete(_ value: T) {
        self.set.removeAll(where: { $0 == value })
    }

    func removeAll() {
        self.set.removeAll()
    }

    // MARK: -

    func difference(_ set: CustomSet<T>) -> CustomSet<T> {
        let result = CustomSet([])
        for value in self.set where set.containsMember(value) == false {
            result.put(value);
        }
        return result
    }

    func intersection(_ set: CustomSet<T>) -> CustomSet<T> {
        let result = CustomSet([])
        for value in set.set where self.containsMember(value) {
            result.put(value)
        }
        return result
    }

    func union(_ rhs: CustomSet<T>) -> CustomSet<T> {
        return CustomSet(self.set + rhs.set)
    }

    func containsMember(_ value: T) -> Bool {
        for v in self.set where v == value {
            return true
        }
        return false
    }

    func isDisjoint(_ set: CustomSet<T>) -> Bool {
        for value in set.set where self.containsMember(value) {
            return false
        }
        return true
    }

    func isSupersetOf(_ set: CustomSet<T>) -> Bool {
        for value in set.set where self.containsMember(value) == false {
            return false
        }
        return true
    }

    // MARK: - Equatable

    static func ==(lhs: CustomSet, rhs: CustomSet) -> Bool {
        return lhs.toSortedArray == rhs.toSortedArray
    }
}
