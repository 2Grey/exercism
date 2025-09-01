//RnaTranscription.TranscriptionError.invalidNucleotide

class RnaTranscription {
    enum TranscriptionError: Error {
        case invalidNucleotide(String)
    }
}


final class Nucleotide {
    private let dna: String
    init(_ dna: String) {
        self.dna = dna
    }

    func complementOfDNA() throws -> String {
        try self.dna.map( { try $0.convert() }).joined()
    }
}

extension Character {
    func convert() throws -> String {
        switch self {
        case "G": return "C"
        case "C": return "G"
        case "T": return "A"
        case "A": return "U"
        default:
            throw RnaTranscription.TranscriptionError.invalidNucleotide("\(self) is not a valid Nucleotide")
        }
    }
}
