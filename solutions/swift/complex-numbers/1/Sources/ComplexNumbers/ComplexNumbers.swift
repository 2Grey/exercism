import Foundation

struct ComplexNumber {
    let realComponent: Double
    let imaginaryComponent: Double

    // MARK: -

    func getRealComponent() -> Double {
        return self.realComponent
    }

    func getImaginaryComponent() -> Double {
        return self.imaginaryComponent
    }

    // MARK: -

    func add(complexNumber: ComplexNumber) -> ComplexNumber {
        ComplexNumber(realComponent: self.realComponent + complexNumber.realComponent,
                      imaginaryComponent: self.imaginaryComponent + complexNumber.imaginaryComponent)
    }

    func subtract(complexNumber: ComplexNumber) -> ComplexNumber {
        ComplexNumber(realComponent: self.realComponent - complexNumber.realComponent,
                      imaginaryComponent: self.imaginaryComponent - complexNumber.imaginaryComponent)
    }

    func multiply(complexNumber: ComplexNumber) -> ComplexNumber {
        ComplexNumber(realComponent: self.realComponent * complexNumber.realComponent - self.imaginaryComponent * complexNumber.imaginaryComponent,
                      imaginaryComponent: self.imaginaryComponent * complexNumber.realComponent + self.realComponent * complexNumber.imaginaryComponent)
    }

    func divide(complexNumber: ComplexNumber) -> ComplexNumber {
        let down: Double = complexNumber.realComponent * complexNumber.realComponent + complexNumber.imaginaryComponent * complexNumber.imaginaryComponent
        let real = self.realComponent * complexNumber.realComponent + self.imaginaryComponent * complexNumber.imaginaryComponent
        let image = self.imaginaryComponent * complexNumber.realComponent - self.realComponent * complexNumber.imaginaryComponent
        return ComplexNumber(realComponent: real / down, imaginaryComponent: image / down)
    }

    // MARK: -

    func absolute() -> Double {
        sqrt(self.realComponent * self.realComponent + self.imaginaryComponent * self.imaginaryComponent)
    }

    func conjugate() -> ComplexNumber {
        ComplexNumber(realComponent: self.realComponent, imaginaryComponent: -self.imaginaryComponent)
    }

    func exponent() -> ComplexNumber {
        let expReal = exp(self.realComponent)
        let real = expReal * cos(self.imaginaryComponent)
        let image = expReal * sin(self.imaginaryComponent)
        return ComplexNumber(realComponent: real, imaginaryComponent: image)
    }
}
