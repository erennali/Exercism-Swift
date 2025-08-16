enum CollatzError: Error {
    case invalidInput
}

class CollatzConjecture {
    static func steps(_ number: Int) throws -> Int {
        guard number > 0 else {
            throw CollatzError.invalidInput
        }

        var n = number
        var count = 0

        while n != 1 {
            if n.isMultiple(of: 2) {
                n /= 2
            } else {
                n = 3 * n + 1
            }
            count += 1
        }
        
        return count
    }
}