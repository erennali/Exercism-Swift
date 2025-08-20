import Foundation

enum QueenError: Error {
    case inValidRow
    case inValidColumn
}

class Queen {
    let row: Int
    let column: Int

    private enum Board {
        static let validCoordinates = 0...7
    }

    init(row: Int, column: Int) throws {
        guard Board.validCoordinates.contains(row) else {
            throw QueenError.inValidRow
        }

        guard Board.validCoordinates.contains(column) else {
            throw QueenError.inValidColumn
        }

        self.row = row
        self.column = column
    }

    func canAttack(other: Queen) -> Bool {
        let onSameRow = self.row == other.row
        let onSameColumn = self.column == other.column
        let onSameDiagonal = abs(self.row - other.row) == abs(self.column - other.column)

        return onSameRow || onSameColumn || onSameDiagonal
    }
}