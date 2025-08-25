class BottleSong {
    let startingBottles: Int

    init(bottles: Int) {
        self.startingBottles = bottles
    }

    func song(takedown: Int) -> [String] {
        var lyrics: [String] = []
        let endCount = startingBottles - takedown + 1

        for bottleCount in stride(from: startingBottles, through: endCount, by: -1) {
            lyrics.append(contentsOf: verse(for: bottleCount))
            if bottleCount > endCount {
                lyrics.append("")
            }
        }
        return lyrics
    }

    private func verse(for number: Int) -> [String] {
        let currentNumberWord = numberAsWord(number)
        let currentBottleForm = bottleForm(for: number)
        let nextNumberWord = numberAsWord(number - 1).lowercased()
        let nextBottleForm = bottleForm(for: number - 1)

        let line1 = "\(currentNumberWord) green \(currentBottleForm) hanging on the wall,"
        let line3 = "And if one green bottle should accidentally fall,"
        let line4 = "There'll be \(nextNumberWord) green \(nextBottleForm) hanging on the wall."

        return [line1, line1, line3, line4]
    }

    private func numberAsWord(_ number: Int) -> String {
        switch number {
        case 10: return "Ten"
        case 9: return "Nine"
        case 8: return "Eight"
        case 7: return "Seven"
        case 6: return "Six"
        case 5: return "Five"
        case 4: return "Four"
        case 3: return "Three"
        case 2: return "Two"
        case 1: return "One"
        case 0: return "no"
        default: return ""
        }
    }

    private func bottleForm(for number: Int) -> String {
        return number == 1 ? "bottle" : "bottles"
    }
}