class ScaleGenerator {
    let tonic: String
    let scaleName: String
    let pattern: String?

    var name: String

    init(tonic: String, scaleName: String, pattern: String? = nil) {
        self.tonic = tonic
        self.scaleName = scaleName
        self.pattern = pattern
        self.name = "\(tonic.uppercased()) \(scaleName)"
    }

    func pitches() -> [String] {
        return []
    }
}

//A    A#    B    C    C#    D    D#    E    F    F#    G    G#    A
//Unison    Min 2nd    Maj 2nd    Min 3rd    Maj 3rd    Per 4th    Tritone    Per 5th    Min 6th    Maj 6th    Min 7th    Maj 7th    Octave
//Dim 3rd    Aug 2nd    Dim 4th        Aug 4th    Dim 5th    Aug 5th    Dim 7th    Aug 6th    Dim 8ve
//Dim 5th
