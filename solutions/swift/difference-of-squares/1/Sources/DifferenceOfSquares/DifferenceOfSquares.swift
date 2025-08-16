class Squares {
  var input: Int
  
  init(_ input: Int) {
    self.input = input
  }
  
  var sumOfSquares: Int {
    let n = self.input
    return n * (n + 1) * (2 * n + 1) / 6
  }
  
  var squareOfSum: Int {
    let n = self.input
    let sum = n * (n + 1) / 2
    return sum * sum
  }
  
  var differenceOfSquares: Int {
    return self.squareOfSum - self.sumOfSquares
  }
}