func totalBirdCount(_ birdsPerDay: [Int]) -> Int {
    var result = 0
    for birdCount in birdsPerDay {
        result += birdCount
    }
    return result
}

func birdsInWeek(_ birdsPerDay: [Int], weekNumber: Int) -> Int {
    let startIdx = (weekNumber - 1) * 7
    let endIdx = startIdx + 6

    var result = 0
    for idx in startIdx...endIdx {
        result += birdsPerDay[idx]
    }
    return result
}

func fixBirdCountLog(_ birdsPerDay: [Int]) -> [Int] {
    var result = birdsPerDay
    for idx in stride(from: 0, to: birdsPerDay.count, by: 2) {
        result[idx] += 1
    }
    return result
}
