import Foundation

struct Acronym {
  static func abbreviate(_ inString: String) -> String {
    return String(
      inString
        .replacingOccurrences(of: "-", with: " ")
        .replacingOccurrences(of: "[^a-zA-Z ]", with: "", options: .regularExpression)
        .components(separatedBy: .whitespaces)
        .compactMap { $0.first }
    ).uppercased()
  }
}