class Raindrops {

    let sounds: String

    init(_ input: Int) {
        var result = ""
        if input % 3 == 0 { result += "Pling"}
        if input % 5 == 0 { result += "Plang" }
        if input % 7 == 0 { result += "Plong" }
        self.sounds = result.isEmpty ? String(input) : result
    }
}
