class Triangle {
    let a: Double
    let b: Double
    let c: Double

    init(_ sides: [Double]) {
        guard sides.count == 3 else {
            self.a = 0
            self.b = 0
            self.c = 0
            return
        }
        self.a = sides[0]
        self.b = sides[1]
        self.c = sides[2]
    }

    private var isTriangle: Bool {
        let sidesArePositive = a > 0 && b > 0 && c > 0
        let inequalityHolds = (a + b >= c) && (b + c >= a) && (a + c >= b)
        return sidesArePositive && inequalityHolds
    }

    var isEquilateral: Bool {
        isTriangle && a == b && b == c
    }

    var isIsosceles: Bool {
        isTriangle && (a == b || b == c || a == c)
    }

    var isScalene: Bool {
        isTriangle && a != b && b != c && a != c
    }
}