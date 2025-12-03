import Foundation

func parse(_ encoded: String) throws -> SGFTree {
    try SGTParser(encoded).parse()
}

// MARK: - SGTParser

private final class SGTParser {

    typealias SGFProperties = [String: [String]]

    // MARK: - Private properties

    private let input: [Character]
    private var index = 0

    // MARK: - Init

    init(_ input: String) {
        self.input = Array(input)
    }

    // MARK: - Parser

    func parse() throws -> SGFTree {
        guard !self.input.isEmpty else { throw SGFParsingError.missingTree }
        return try parseTree()
    }

    private func parseTree() throws -> SGFTree {
        try check("(", SGFParsingError.missingTree)

        let nodes = try self.parseNodes()
        guard var root = nodes.first else { throw SGFParsingError.noNodes }
        for nNodes in nodes.dropFirst() {
            root.children.append(nNodes)
        }

        while let ch = peek(), ch == "(" {
            root.children.append(try parseTree())
        }

        try check(")", SGFParsingError.missingTree)

        return root
    }

    private func parseNodes() throws -> [SGFTree] {
        var nodes: [SGFTree] = []

        while let ch = peek(), ch == ";" {
            step()

            let props = try parseProperties()
            var node = SGFTree(properties: props)

            if let p = peek(), p == "(" {
                node.children.append(try parseTree())
            }
            nodes.append(node)
        }

        return nodes
    }

    private func parseProperties() throws -> SGFProperties {
        var properties: SGFProperties = [:]
        while let ch = peek(), ch.isLetter {
            let key = try parseKey()
            var values: [String] = []
            guard let nCh = peek(), nCh == "[" else { throw SGFParsingError.noDelimiter }
            while let next = peek(), next == "[" {
                step()
                values.append(try parseValue())
                try check("]", SGFParsingError.noDelimiter)
            }
            properties[key] = values
        }
        return properties
    }

    private func parseKey() throws -> String {
        var result = ""
        while let ch = peek(), ch.isLetter {
            guard !ch.isLowercase else { throw SGFParsingError.lowerCaseProperty }
            result.append(ch)
            step()
        }
        return result
    }

    private func parseValue() throws -> String {
        var value = ""
        while let ch = peek(), ch != "]" {
            if ch == "\\" {
                step()
                guard let esc = peek() else { break }
                if esc == "\n" || esc == "\r" {
                    // Do nothing
                } else if esc.isWhitespace {
                    value.append(" ")
                } else {
                    value.append(esc)
                }
            } else if ch.isNewline {
                value.append(ch)
            } else if ch.isWhitespace {
                value.append(" ")
            } else {
                value.append(ch)
            }
            step()
        }
        return value
    }

    // MARK: - Helpers

    private func step() {
        self.index += 1
    }

    private func peek() -> Character? {
        index < input.count ? input[index] : nil
    }

    private func check(_ character: Character, _ error: SGFParsingError) throws {
        guard let cur = self.peek(), cur == character else {
            throw error
        }
        step()
    }
}
