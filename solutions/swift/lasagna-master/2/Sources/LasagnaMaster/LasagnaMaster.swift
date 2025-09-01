func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    guard elapsedMinutes < expectedMinutesInOven else { return 0 }
    return expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: String...) -> Int {
    return layers.count * 2
}

func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    let noodleCount = layers.filter({ $0 == "noodles" }).count * 3
    let souseCount = Double(layers.filter({ $0 == "sauce" }).count) * 0.2
    return (noodles: noodleCount, sauce: souseCount)
}

func toOz(_ amount: inout (noodles: Int, sauce: Double)) {
    amount = (noodles: amount.noodles, sauce: amount.sauce * 33.814)
}

func redWine(layers: String...) -> Bool {
    let lhsCount = layers.filter({ ["mozzarella", "ricotta", "béchamel"].contains($0) }).count
    let rhsCount = layers.filter({ ["meat", "sauce"].contains($0) }).count
    return lhsCount < rhsCount
}
