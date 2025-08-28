import Foundation

struct Allergen: OptionSet {
    let rawValue: UInt

    static let eggs         = Allergen(rawValue: 1 << 0)
    static let peanuts      = Allergen(rawValue: 1 << 1)
    static let shellfish    = Allergen(rawValue: 1 << 2)
    static let strawberries = Allergen(rawValue: 1 << 3)
    static let tomatoes     = Allergen(rawValue: 1 << 4)
    static let chocolate    = Allergen(rawValue: 1 << 5)
    static let pollen       = Allergen(rawValue: 1 << 6)
    static let cats         = Allergen(rawValue: 1 << 7)

    static let all: [(name: String, allergen: Allergen)] = [
        ("eggs", .eggs), ("peanuts", .peanuts), ("shellfish", .shellfish),
        ("strawberries", .strawberries), ("tomatoes", .tomatoes),
        ("chocolate", .chocolate), ("pollen", .pollen), ("cats", .cats)
    ]

    static func allergenFor(item: String) -> Allergen? {
        return all.first { $0.name == item }?.allergen
    }
}

class Allergies {
    let allergens: Allergen

    init(_ score: Int) {
        self.allergens = Allergen(rawValue: UInt(score))
    }

    func allergicTo(item: String) -> Bool {
        guard let allergen = Allergen.allergenFor(item: item) else {
            return false
        }
        return self.allergens.contains(allergen)
    }

    func list() -> [String] {
        return Allergen.all.compactMap { name, allergen in
            self.allergens.contains(allergen) ? name : nil
        }
    }
}