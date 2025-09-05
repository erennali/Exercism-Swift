import Foundation

func primeFactors(_ number: Int64) -> [Int64] {
  var factors: [Int64] = []
  var remainingNumber = number
  var divisor: Int64 = 2

  while divisor * divisor <= remainingNumber {
    while remainingNumber % divisor == 0 {
      factors.append(divisor)
      remainingNumber /= divisor
    }
    divisor += 1
  }

  if remainingNumber > 1 {
    factors.append(remainingNumber)
  }

  return factors
}