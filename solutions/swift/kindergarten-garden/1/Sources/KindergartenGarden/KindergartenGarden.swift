import Foundation

class Garden {
    enum Plant: String {
        case clover = "C", grass = "G", radishes = "R", violets = "V"
        init?(character: Character) { self.init(rawValue: String(character)) }
    }

    private let row1: [Character]
    private let row2: [Character]
    private let children: [String]

    private static let defaultChildren = [
        "Alice", "Bob", "Charlie", "David", "Eve", "Fred",
        "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"
    ]

    init(_ diagram: String, children: [String] = Garden.defaultChildren) {
        let sortedChildren = children.sorted()
        let rows = diagram.components(separatedBy: "\n")

        if rows.count == 2 && rows[0].count == rows[1].count && rows[0].count.isMultiple(of: 2) {
            self.row1 = Array(rows[0])
            self.row2 = Array(rows[1])
            let studentCount = self.row1.count / 2
            self.children = Array(sortedChildren.prefix(studentCount))
        } else {
            self.row1 = []
            self.row2 = []
            self.children = []
        }
    }

    func plantsForChild(_ child: String) -> [Plant] {
        guard let childIndex = self.children.firstIndex(of: child) else { return [] }
        
        let i = childIndex * 2
        
        guard i + 1 < self.row1.count, i + 1 < self.row2.count else { return [] }
        
        return [
            row1[i], row1[i + 1],
            row2[i], row2[i + 1]
        ].compactMap { Plant(character: $0) }
    }
}