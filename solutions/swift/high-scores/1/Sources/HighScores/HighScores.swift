import Foundation

struct HighScores {

    let scores: [Int]

    var latest: Int? { scores.last }
    var personalBest: Int? { scores.max() }
    var topThree: [Int] { Array(scores.sorted(by: >)[0 ..< (min(scores.count, 3))]) }
}
