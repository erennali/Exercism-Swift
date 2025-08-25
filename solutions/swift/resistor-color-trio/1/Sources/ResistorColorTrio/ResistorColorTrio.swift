import Foundation

enum ResistorColorTrio {
    private enum Color: String, CaseIterable {
        case black, brown, red, orange, yellow, green, blue, violet, grey, white
        var value: Int { Color.allCases.firstIndex(of: self)! }
    }

    enum ResistorError: Error {
        case invalidColor
    }

    static func label(for colors: [String]) throws -> String {
        guard colors.count >= 3,
              let color1 = Color(rawValue: colors[0]),
              let color2 = Color(rawValue: colors[1]),
              let color3 = Color(rawValue: colors[2])
        else {
            throw ResistorError.invalidColor
        }

        let baseValue = color1.value * 10 + color2.value
        let totalOhms = baseValue * Int(pow(10.0, Double(color3.value)))

        if totalOhms >= 1_000_000_000 {
            return "\(totalOhms / 1_000_000_000) gigaohms"
        } else if totalOhms >= 1_000_000 {
            return "\(totalOhms / 1_000_000) megaohms"
        } else if totalOhms >= 1_000 {
            return "\(totalOhms / 1_000) kiloohms"
        } else {
            return "\(totalOhms) ohms"
        }
    }
}