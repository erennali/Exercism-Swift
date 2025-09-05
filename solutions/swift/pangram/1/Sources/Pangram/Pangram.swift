import Foundation

func isPangram(_ text: String) -> Bool {
  return Set("abcdefghijklmnopqrstuvwxyz").isSubset(of: text.lowercased())
}