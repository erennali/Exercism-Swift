enum GrainsError: Error {
    case inputTooLow
    case inputTooHigh
}

struct Grains {
    static func square(_ num: Int) throws -> UInt64 {
        if num < 1 {
            throw GrainsError.inputTooLow
        }
        if num > 64 {
            throw GrainsError.inputTooHigh
        }
        return 1 << (num - 1)
    }

    static let total = UInt64.max
}