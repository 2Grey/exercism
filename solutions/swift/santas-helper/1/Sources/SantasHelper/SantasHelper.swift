import Foundation

func cartesianToPolar(_ cart: (x: Double, y: Double)) -> (r: Double, phi: Double) {
    let r = sqrt(cart.x * cart.x + cart.y * cart.y)
    let phi = atan2(cart.y, cart.x)
    return (r, phi)
}

func combineRecords(
    production: (toy: String, id: Int, prouctLead: String),
    gifts: (Int, [String])
) -> (id: Int, toy: String, productLead: String, recipients: [String]) {
    return combineRecords(production: (toy: production.toy, id: production.id, productLead: production.prouctLead), gifts: gifts)
}

func combineRecords(
    production: (toy: String, id: Int, productLead: String),
    gifts: (Int, [String])
) -> (id: Int, toy: String, productLead: String, recipients: [String]) {
    return (id: production.id, toy: production.toy, productLead: production.productLead, recipients: gifts.1)
}
