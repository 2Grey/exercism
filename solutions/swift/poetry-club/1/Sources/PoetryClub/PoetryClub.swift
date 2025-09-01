import Foundation

func splitOnNewlines(_ poem: String) -> [String] {
    var result: [String] = []
    var tmp = ""
    for c in poem {
        if c.isNewline {
            result.append(tmp)
            tmp = ""
        } else {
            tmp += String(c)
        }
    }
    result.append(tmp)
    return result
}

func firstLetter(_ line: String) -> Character {
    line.first ?? "_"
}

func capitalize(_ phrase: String) -> String {
    phrase.capitalized
}

func trimFromEnd(_ line: String) -> String {
    var result = line
    while result.last?.isWhitespace == true {
        result = String(result.dropLast())
    }
    return result
}

func lastLetter(_ line: String) -> Character {
    line.last ?? "_"
}

func backDoorPassword(_ phrase: String) -> String {
    capitalize(phrase) + ", please"
}

func ithLetter(_ line: String, i: Int) -> Character {
    guard i < line.count else { return " " }
    return line[line.index(line.startIndex, offsetBy: i)]
}

func secretRoomPassword(_ phrase: String) -> String {
    phrase.uppercased() + "!"
}
