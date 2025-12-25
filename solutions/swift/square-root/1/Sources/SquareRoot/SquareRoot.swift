struct SquareRoot {
    static func squareRoot(_ value: Int) -> Int {
        if value < 2 { return value }
        return value > 100 ? squareRootNewton(value) : squareRootBinarySearch(value)
    }
}

func squareRootBinarySearch(_ number: Int) -> Int {
    var start = 1
    var end = number / 2

    while start <= end {
        let mid = start + (end - start) / 2
        let squared = mid * mid

        if squared == number {
            return mid
        } else if squared < number {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }

    return end
}

func squareRootNewton(_ number: Int) -> Int {
    var root = number
    while root * root > number {
        root = (root + number / root) / 2
    }

    return root
}
