import Foundation

class House {
    private static let parts: [String] = [
        "the house that Jack built.",
        "the malt that lay in",
        "the rat that ate",
        "the cat that killed",
        "the dog that worried",
        "the cow with the crumpled horn that tossed",
        "the maiden all forlorn that milked",
        "the man all tattered and torn that kissed",
        "the priest all shaven and shorn that married",
        "the rooster that crowed in the morn that woke",
        "the farmer sowing his corn that kept",
        "the horse and the hound and the horn that belonged to"
    ]

    static func recite(start: Int, end: Int) -> String {
        return (start...end)
            .map { verse(number: $0) }
            .joined(separator: "\n")
    }

    private static func verse(number: Int) -> String {
        let verseParts = parts[0..<number].reversed().joined(separator: " ")
        return "This is \(verseParts)"
    }
}