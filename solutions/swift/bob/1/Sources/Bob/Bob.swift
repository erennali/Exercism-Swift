import Foundation

class Bob {
  static func response(_ message: String) -> String {
    let trimmed = message.trimmingCharacters(in: .whitespacesAndNewlines)
    let isQuestion = trimmed.hasSuffix("?")
    let hasLetters = trimmed.contains { $0.isLetter }
    let isYelling = hasLetters && trimmed.uppercased() == trimmed
    
    if trimmed.isEmpty {
      return "Fine. Be that way!"
    } else if isYelling && isQuestion {
      return "Calm down, I know what I'm doing!"
    } else if isYelling {
      return "Whoa, chill out!"
    } else if isQuestion {
      return "Sure."
    } else {
      return "Whatever."
    }
  }
}