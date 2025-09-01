//Solution goes in Sources

class Garden {

    private static let defaultChildren: [String] = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

    enum Plants: Character {
        case grass = "G"
        case clover = "C"
        case radishes = "R"
        case violets = "V"
    }

    private let firstLine: String
    private let secondLine: String
    private let children: [String]

    init(_ raw: String, children: [String] = Garden.defaultChildren) {
        let split = raw.split(separator: "\n").map({ String($0) })
        self.firstLine = split.first!
        self.secondLine = split.last!
        self.children = children.sorted()
    }

    func plantsForChild(_ name: String) -> [Plants] {
        guard var idx = self.children.firstIndex(of: name) else { return [] }
        idx *= 2

        let startIndex = firstLine.index(firstLine.startIndex, offsetBy: idx)
        let endIndex = firstLine.index(firstLine.startIndex, offsetBy: idx + 1)
        let plants = firstLine[startIndex...endIndex] + secondLine[startIndex...endIndex]
        print(plants)
        return plants.compactMap({ Plants(rawValue: $0) })
    }
}
