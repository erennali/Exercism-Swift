func isIsogram(_ string: String) -> Bool {
    let letters = string.lowercased().filter { $0.isLetter }
    return Set(letters).count == letters.count
}