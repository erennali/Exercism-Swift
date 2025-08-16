class ETL {
  static func transform(_ old: [String: [String]]) -> [String: Int] {
    var new = [String: Int]()
    for (key, value) in old {
      let score = Int(key)!
      for letter in value {
        new[letter.lowercased()] = score
      }
    }
    return new
  }
}