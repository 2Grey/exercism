import Foundation

class ScaleGenerator {
    private static let sharpScale = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    private static let flatScale = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]
    private static let flatKeys = ["F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb"]

    private enum Interval: Character {
        case minor = "m"
        case major = "M"
        case augmented = "A"

        var interval: Int {
            switch self {
            case .minor: return 1
            case .major: return 2
            case .augmented: return 3
            }
        }
    }

    private let tonic: String
    private let pattern: String
    private(set) var name: String

    init(tonic: String, scaleName: String, pattern: String = "") {
        self.tonic = tonic
        self.pattern = pattern
        self.name = "\(tonic.uppercased()) \(scaleName)"
    }

    func pitches() -> [String] {
        let pitches = self.generateChromaticPattern()

        guard self.pattern.isEmpty == false else { return pitches }

        var index = 0
        return self.pattern.map {
            let pitch = pitches[index]
            index += Interval(rawValue: $0)?.interval ?? 0
            return pitch
        }
    }

    private func generateChromaticPattern() -> [String] {
        let pitches = ScaleGenerator.flatKeys.contains(self.tonic) ? ScaleGenerator.flatScale : ScaleGenerator.sharpScale

        let capitalizedTonic = tonic.capitalized
        var returnArray = [String]()

        guard var startIndex = pitches.index(of: capitalizedTonic) else { return returnArray }

        var pitch = capitalizedTonic
        repeat {
            startIndex = (startIndex == pitches.count - 1) ? 0 : startIndex + 1
            returnArray.append(pitch)
            pitch = pitches[startIndex]
        } while pitch != capitalizedTonic
        return returnArray
    }
}
