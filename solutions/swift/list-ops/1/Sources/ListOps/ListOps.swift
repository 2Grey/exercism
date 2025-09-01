class ListOps {

    static func append<T>(_ lhs: [T], _ rhs: [T]) -> [T] {
        var result: [T] = []
        for v in lhs {
            result.append(v)
        }
        for v in rhs {
            result.append(v)
        }
        return result
    }

    static func concat<T>(_ lists: [T]...) -> [T] {
        var result: [T] = []
        for array in lists {
            for v in array {
                result.append(v)
            }
        }
        return result
    }

    static func filter<T>(_ list: [T], _ filter: (T) -> Bool) -> [T] {
        var result: [T] = []
        for v in list {
            if filter(v) {
                result.append(v)
            }
        }

        return result
    }

    static func length<T>(_ list: [T]) -> Int {
        var result = 0
        for _ in list {
            result += 1
        }
        return result
    }

    static func map<T>(_ list: [T], _ mapper: (T) -> T) -> [T] {
        var result: [T] = []
        for v in list {
            result.append(mapper(v))
        }
        return result
    }

    static func foldLeft<T>(_ list: [T], accumulated: T, combine: (T, T) -> T) -> T {
        var result = accumulated

        for v in list {
            result = combine(result, v)
        }

        return result
    }

    static func foldRight<T>(_ list: [T], accumulated: T, combine: (T, T) -> T) -> T {
        var result = accumulated

        for idx in 0..<list.count {
            let v = list[list.count - idx - 1]
            result = combine(v, result)
        }

        return result
    }

    static func reverse<T>(_ list: [T]) -> [T] {
        var result: [T] = []
        for v in list {
            result.insert(v, at: 0)
        }
        return result
    }
}
