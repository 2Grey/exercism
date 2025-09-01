import Foundation

class BottleSong {
    
    // MARK: - Private
    
    private var bottles: Int
    
    private lazy var numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .spellOut
        return nf
    }()
    
    // MARK: - Init
    
    init(bottles: Int) {
        self.bottles = bottles
    }
    
    // MARK: - Song
    
    func song(takedown: Int) -> [String] {
        var result: [String] = []
        for _ in 0..<takedown {
            if !result.isEmpty { result.append("") }
            result.append(contentsOf: self.calculateLine(number: self.bottles))
            self.bottles -= 1
        }
        return result
    }
    
    func calculateLine(number: Int) -> [String] {
        func bottleText(count: Int) -> String { count != 1 ? "bottles" : "bottle" }
        
        let curNumberText = numberFormatter.string(from: NSNumber(integerLiteral: number))!
        let nextNumberText = (number - 1 > 0) ? numberFormatter.string(from: NSNumber(integerLiteral: number - 1))! : "no"
        
        let curBottleText = bottleText(count: number)
        let nextBottleText = bottleText(count: number - 1)
        
        let firstLines = "\(curNumberText.capitalized) green \(curBottleText) hanging on the wall,"
        
        return [
            firstLines,
            firstLines,
            "And if one green bottle should accidentally fall,",
            "There'll be \(nextNumberText) green \(nextBottleText) hanging on the wall."
        ]
    }
}