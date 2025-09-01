import Foundation

class DNA {
    private let strand: String

    init?(strand: String) {
        let allowed = ["A", "C", "G", "T"]
        guard strand.allSatisfy({allowed.contains(String($0))}) else { return nil }
        self.strand = strand
    }

    func counts() -> [String: Int] {
        var result: [String: Int] = ["A": 0, "T" : 0, "C" : 0, "G": 0]
        for char in self.strand {
            result[String(char), default: 0] += 1
        }
        return result
    }

    func count(_ char: String) -> Int {
        self.strand.filter({ String($0) == char }).count
    }
}
