import Foundation

class Anagram {
    let word: String
    let sortedWord: [Character]

    init(word: String) {
        self.word = word
        self.sortedWord = word.lowercased().sorted()
    }

    func match(_ candidates: [String]) -> [String] {
        return candidates.filter { candidate in
            guard self.word.lowercased() != candidate.lowercased() else {
                return false
            }
            return self.sortedWord == candidate.lowercased().sorted()
        }
    }
}