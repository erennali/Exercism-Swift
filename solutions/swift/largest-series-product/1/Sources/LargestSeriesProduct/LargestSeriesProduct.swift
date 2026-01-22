import Foundation

enum NumberSeriesError: Error {
    case spanLongerThanInput
    case invalidCharacter
    case spanIsZeroOrNegative
}

class NumberSeries {
    private let digits: [Int]

    init(_ numberString: String) throws {
        self.digits = try numberString.map {
            guard let digit = $0.wholeNumberValue else {
                throw NumberSeriesError.invalidCharacter
            }
            return digit
        }
    }

    func largestProduct(_ span: Int) throws -> Int {
        guard span >= 0 else { throw NumberSeriesError.spanIsZeroOrNegative }
        guard span <= digits.count else { throw NumberSeriesError.spanLongerThanInput }

        if span == 0 { return 1 }

        return (0...digits.count - span)
            .map { digits[$0..<($0 + span)].reduce(1, *) }
            .max()!
    }
}