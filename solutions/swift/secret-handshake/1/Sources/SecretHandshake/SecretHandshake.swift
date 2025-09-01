struct SecretHandshake {

    struct Code: OptionSet {
        let rawValue: Int

        static let wink     = Code(rawValue: 1 << 0)
        static let blink    = Code(rawValue: 1 << 1)
        static let eyes     = Code(rawValue: 1 << 2)
        static let jump     = Code(rawValue: 1 << 3)
        static let revs     = Code(rawValue: 1 << 4)
    }

    private var output: [String] = []

    init(_ raw: Int) {
        let code = Code(rawValue: raw)

        var result: [String] = []
        if code.contains(.wink) { result.append("wink")}
        if code.contains(.blink) { result.append("double blink")}
        if code.contains(.eyes) { result.append("close your eyes") }
        if code.contains(.jump) { result.append("jump") }

        if code.contains(.revs) {
            result = result.reversed()
        }
        self.output = result
    }

    var commands: [String] {
        self.output
    }
}
