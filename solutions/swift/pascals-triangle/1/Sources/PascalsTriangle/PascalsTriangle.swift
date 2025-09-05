import Foundation

func pascalsTriangle(rows: Int) -> [[Int]] {
  guard rows > 0 else {
    return []
  }

  var triangle = [[1]]

  for _ in 1..<rows {
    let previousRow = triangle.last!
    let middleElements = zip(previousRow, previousRow.dropFirst()).map { $0 + $1 }
    let newRow = [1] + middleElements + [1]
    triangle.append(newRow)
  }

  return triangle
}