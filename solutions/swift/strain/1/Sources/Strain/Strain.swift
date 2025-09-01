extension Array {
    func keep(_ execute: (Element) -> Bool) -> [Element] {
        return self.filter({ execute($0) })
    }

    func discard(_ execute: (Element) -> Bool) -> [Element] {
        return self.filter({ !execute($0) })
    }
}
