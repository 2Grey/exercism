struct ProteinTranslation {

    enum TranslationError: Error {
        case wrongInputCount
        case unknownInput
    }

    struct Acid {
        let code: String
        let name: String
        let isStop: Bool
    }

    static let acids = [
        Acid(code: "AUG", name: "Methionine", isStop: false),
        Acid(code: "UUU", name: "Phenylalanine", isStop: false),
        Acid(code: "UUC", name: "Phenylalanine", isStop: false),
        Acid(code: "UUA", name: "Leucine", isStop: false),
        Acid(code: "UUG", name: "Leucine", isStop: false),
        Acid(code: "UCU", name: "Serine", isStop: false),
        Acid(code: "UCC", name: "Serine", isStop: false),
        Acid(code: "UCA", name: "Serine", isStop: false),
        Acid(code: "UCG", name: "Serine", isStop: false),
        Acid(code: "UAU", name: "Tyrosine", isStop: false),
        Acid(code: "UAC", name: "Tyrosine", isStop: false),
        Acid(code: "UGU", name: "Cysteine", isStop: false),
        Acid(code: "UGC", name: "Cysteine", isStop: false),
        Acid(code: "UGG", name: "Tryptophan", isStop: false),
        Acid(code: "UAA", name: "STOP", isStop: true),
        Acid(code: "UAG", name: "STOP", isStop: true),
        Acid(code: "UGA", name: "STOP", isStop: true),
    ]

    static func translationOfCodon(_ input: String) throws -> String {
        guard let model = self.model(for: input) else { throw TranslationError.unknownInput }
        return model.name
    }

    static func translationOfRNA(_ input: String) throws -> [String] {
        guard input.count % 3 == 0 else { throw TranslationError.wrongInputCount}
        var result: [String] = []

        for idx in 0..<input.count / 3 {
            let startIndex = input.index(input.startIndex, offsetBy: idx * 3)
            let endIndex = input.index(startIndex, offsetBy: 3)
            let code = input[startIndex..<endIndex]

            if let model = self.model(for: String(code)) {
                if model.isStop { return result }
                result.append(model.name)
            } else {
                throw TranslationError.unknownInput
            }
        }

        return result
    }

    private static func model(for input: String) -> Acid? {
        return self.acids.first(where: { $0.code == input })
    }
}
