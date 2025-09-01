final class Triangle {
    private(set) var kind: String = ""

    init(_ a: Float, _ b: Float, _ c: Float) {
        self.kind = {
            if a + b <= c || a + c <= b || b + c <= a { return "ErrorKind" }
            if a == b, b == c { return "Equilateral" }
            if a == b || b == c || c == a { return "Isosceles" }
            return "Scalene"
        }()

    }
}
