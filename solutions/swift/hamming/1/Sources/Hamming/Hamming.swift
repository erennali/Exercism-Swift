enum HammingError: Error {
    case differentLengths
}

struct Hamming {
    static func compute(_ dnaSequence: String, against: String) throws -> Int? {
        guard dnaSequence.count == against.count else {
            throw HammingError.differentLengths
        }
        return zip(dnaSequence, against).filter { $0 != $1 }.count
    }
}