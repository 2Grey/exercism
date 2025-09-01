import Foundation

final class Series {
    private let input: [Int]

    init(_ input: String) {
        self.input = input.compactMap({ Int(String($0)) })
    }

    func slices(_ slice: Int) -> [[Int]] {
        let totalSlices = self.input.count - slice + 1
        if totalSlices < 1 {
            return []
        } else if totalSlices == self.input.count {
            return [self.input]
        } else {
            var result: [[Int]] = []
            for idx in 0..<totalSlices {
                let split = Array(self.input[idx..<idx+slice])
                result.append(split)
            }
            return result
        }
    }
}
