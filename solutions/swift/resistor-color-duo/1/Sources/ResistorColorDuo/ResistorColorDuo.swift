import Foundation

enum ResistorColorDuo: Int {
    case black = 0, brown, red, orange, yellow, green, blue, violet, grey, white

    private static let colorMap: [String: Int] = [
        "black": 0, "brown": 1, "red": 2, "orange": 3, "yellow": 4,
        "green": 5, "blue": 6, "violet": 7, "grey": 8, "white": 9
    ]

    static func value(for colors: [String]) -> Int {
        let firstValue = colorMap[colors[0]] ?? 0
        let secondValue = colorMap[colors[1]] ?? 0

        return firstValue * 10 + secondValue
    }
}