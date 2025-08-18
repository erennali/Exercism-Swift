import Foundation

class IsbnVerifier {
  static func isValid(_ string: String) -> Bool {
    let cleaned = string.replacingOccurrences(of: "-", with: "")
    guard cleaned.count == 10 else { return false }

    var sum = 0
    for (index, character) in cleaned.enumerated() {
      let value: Int
      if let digit = character.wholeNumberValue {
        value = digit
      } else if character == "X", index == 9 {
        value = 10
      } else {
        return false
      }
      sum += value * (10 - index)
    }
    
    return sum % 11 == 0
  }
}