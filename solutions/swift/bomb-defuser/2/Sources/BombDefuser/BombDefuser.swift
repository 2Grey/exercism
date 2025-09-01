let flip: ((String, String, String)) -> (String, String, String) = { ($0.1, $0.0, $0.2) }

let rotate: ((String, String, String)) -> (String, String, String) = { ($0.1, $0.2, $0.0) }

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> (UInt8, (String, String, String)) -> (String, String, String) {
    func f(_ mask: UInt8, _ args: (String, String, String)) -> (String, String, String) {
        return mask.bits().reduce(into: args) { $0 = (($1 == .zero) ? flipper($0) : rotator($0)) }
    }
    return f
}

extension UInt8 {
    enum Bit { case zero, one }

    private func bit(_ i: Int, of uint8: UInt8) -> Bit {
        let powOfTwo = (0...7).map { return UInt8(1) << $0 }
        return (uint8 & powOfTwo[i] != 0) ? Bit.one : Bit.zero
    }

    func bits() -> [Bit] {
        return Array((0...7)).map { bit($0, of: self) }
    }
}
