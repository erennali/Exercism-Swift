import Foundation

struct Matrix {
    let rows: [[Int]]

    var columns: [[Int]] {
        guard let firstRow = rows.first else {
            return []
        }

        return (0..<firstRow.count).map { columnIndex in
            rows.map { $0[columnIndex] }
        }
    }

    init(_ string: String) {
        self.rows = string.components(separatedBy: .newlines)
            .map { rowString in
                rowString.split(separator: " ").compactMap { Int($0) }
            }
    }
}