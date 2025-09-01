func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    guard let diameter = diameter,
          let slices = slices,
          diameter >= 0,
          slices > 1
    else {
        return nil
    }

    let r = diameter / 2.0
    return (Double.pi * r * r) / Double(slices)
}

func biggestSlice(
    diameterA: String, slicesA: String,
    diameterB: String, slicesB: String
) -> String {
    let sizeA = sliceSize(diameter: diameterA, slices: slicesA)
    let sizeB = sliceSize(diameter: diameterB, slices: slicesB)

    switch (sizeA, sizeB) {
    case let (.some(a), .some(b)) where a > b:
        return "Slice A is bigger"
    case (.some(_), .none):
        return "Slice A is bigger"
    case let (.some(a), .some(b)) where a < b:
        return "Slice B is bigger"
    case (.none, .some(_)):
        return "Slice B is bigger"
    case let (.some(a), .some(b)) where a == b:
        return "Neither slice is bigger"
    case (.none, .none):
        return "Neither slice is bigger"
    default:
        return "?"
    }
}

private func sliceSize(diameter: String?, slices: String?) -> Double? {
    guard let d = diameter, let s = slices, let dd = Double(d), let ss = Int(s) else {
        return nil
    }
    return sliceSize(diameter: dd, slices: ss)
}
