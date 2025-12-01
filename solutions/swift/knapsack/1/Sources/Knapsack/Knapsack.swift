struct Knapsack {

    static func maximumValue(_ items: [Item], _ maxWeight: Int) -> Int {
        var tmp = Array(repeating: 0, count: maxWeight + 1)

        for item in items {
            for weight in stride(from: maxWeight, through: item.weight, by: -1) {
                tmp[weight] = max(tmp[weight], item.value + tmp[weight - item.weight])
            }
        }
        return tmp[maxWeight]
    }
}
