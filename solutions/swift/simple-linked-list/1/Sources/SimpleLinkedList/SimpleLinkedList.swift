final class Element<T> {

    let value: T?
    var next: Element?

    init(_ value: T? = nil, _ next: Element? = nil) {
        self.value = value
        self.next = next
    }

    class func fromArray(_ array: [T]) -> Element {
        if array.isEmpty {
            return Element<T>()
        } else if array.count == 1, let value = array.first {
            return Element(value, nil)
        } else {
            let elements = array.map({ Element($0) })
            return self.fold(elements: elements)
        }
    }

    func reverseElements() -> Element {
        var elements: [Element<T>] = []
        var current: Element<T>? = self

        while let tmp = current {
            elements.append(tmp)
            current = tmp.next
        }

        return Element.fold(elements: elements.reversed())
    }

    func toArray() -> [T] {
        var result: [T?] = []
        var current: Element<T>? = self

        while let tmp = current {
            result.append(tmp.value)
            current = tmp.next
        }

        return result.compactMap({ $0 })
    }

    private class func fold(elements: [Element<T>]) -> Element {
        var resultElement = elements.last
        for element in elements.dropLast().reversed() {
            element.next = resultElement
            resultElement = element
        }
        return resultElement!
    }
}
