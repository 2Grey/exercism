import Foundation

class Grains {
    enum GrainsError: Error {
        case inputTooHigh(String)
        case inputTooLow(String)
    }

    static func square(_ count: Int) throws -> Double {
        guard count >= 1 else {
            throw GrainsError.inputTooLow("Input[\(count)] invalid. Input should be between 1 and 64 (inclusive)")
        }
        guard count <= 64 else {
            throw GrainsError.inputTooHigh("Input[\(count)] invalid. Input should be between 1 and 64 (inclusive)")
        }
        return pow(2.0, Double(count - 1))
    }

    static var total: Double {
        return pow(2.0, Double(64))
    }
}
