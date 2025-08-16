import Foundation

enum ResistorColor {
    static let colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

    static func colorCode(for color: String) throws -> Int {
        guard let index = colors.firstIndex(of: color) else {
            throw "Geçersiz renk" as! Error
        }
        return index
    }
}