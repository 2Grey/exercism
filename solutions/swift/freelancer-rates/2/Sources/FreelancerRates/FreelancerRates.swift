func dailyRateFrom(hourlyRate: Int) -> Double { 
    Double(hourlyRate * 8)
}  

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let d = 1.0 - (discount / 100.0)
    return (dailyRateFrom(hourlyRate: hourlyRate) * 22 * d).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
    let day = dailyRateFrom(hourlyRate: hourlyRate)
    let d = 1.0 - (discount / 100)
    let dDay = day * d
    return (budget / dDay).rounded(.down)
}
