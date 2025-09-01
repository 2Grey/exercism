func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    let f = monthlyBudget * 5 * 12
    if f >= price {
        return "Yes! I'm getting a \(vehicle)"
    } else if f + monthlyBudget * 10 >= price {
        return "I'll have to be frugal if I want a \(vehicle)"
    } else {
        return "Darn! No \(vehicle) for me"
    }
}

func licenseType(numberOfWheels wheels: Int) -> String {
    switch wheels {
    case (2...3): return "You will need a motorcycle license for your vehicle"
    case (4...6): return "You will need an automobile license for your vehicle"
    case 18: return "You will need a commercial trucking license for your vehicle"
    default: return "We do not issue licenses for those types of vehicles"
    }
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
    guard yearsOld < 10 else { return 25 }

    var result: Double = max(Double(msrp), 25_000.0)
    result -= (result * 0.1 * Double(yearsOld))
    result /= 100
    
    return Int(result)
}
