
final class SpaceAge {
    let seconds: UInt

    enum Planet: UInt {
        case earth = 31_557_600
        case mercury = 7_600_543
        case venus = 19_414_149
        case mars = 59_354_032
        case jupiter = 374_355_659
        case saturn = 929_292_362
        case uranus = 2_651_370_019
        case neptune = 5_200_418_560

        func from(age: UInt) -> Double {
            Double(age) / Double(self.rawValue)
        }
    }

    init(_ seconds: UInt) {
        self.seconds = seconds
    }

    // MARK: - Ages

    var onEarth: Double {
        Planet.earth.from(age: self.seconds)
    }

    var onMercury: Double {
        Planet.mercury.from(age: self.seconds)
    }

    var onVenus: Double {
        Planet.venus.from(age: self.seconds)
    }

    var onMars: Double {
        Planet.mars.from(age: self.seconds)
    }

    var onJupiter: Double {
        Planet.jupiter.from(age: self.seconds)
    }

    var onSaturn: Double {
        Planet.saturn.from(age: self.seconds)
    }

    var onUranus: Double {
        Planet.uranus.from(age: self.seconds)
    }

    var onNeptune: Double {
        Planet.neptune.from(age: self.seconds)
    }
}
