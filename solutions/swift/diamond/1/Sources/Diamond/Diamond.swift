import Foundation

class Diamond {
  static func makeDiamond(letter: Character) -> [String] {
    guard let aAscii = Character("A").asciiValue,
          let letterAscii = letter.asciiValue else { return [] }

    let targetIndex = Int(letterAscii - aAscii)
    
    let topHalf = (0...targetIndex).map { i -> String in
      let char = Character(Unicode.Scalar(aAscii + UInt8(i)))
      let outerSpaces = String(repeating: " ", count: targetIndex - i)
      
      if i == 0 {
        return "\(outerSpaces)A\(outerSpaces)"
      } else {
        let innerSpaces = String(repeating: " ", count: 2 * i - 1)
        return "\(outerSpaces)\(char)\(innerSpaces)\(char)\(outerSpaces)"
      }
    }
    
    return topHalf + topHalf.dropLast().reversed()
  }
}