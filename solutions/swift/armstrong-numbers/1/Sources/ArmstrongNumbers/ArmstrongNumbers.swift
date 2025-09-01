import Foundation
func isArmstrongNumber(_ number: Int) -> Bool {
    let str = String(number)
    let power = str.count
    return Decimal(number) == str.reduce(0) { $0 + pow(Decimal(Int(String($1))!), power) }
}