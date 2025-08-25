import Foundation

func sieve(limit: Int) -> [Int] {
  guard limit >= 2 else { return [] }

  var isPrime = [Bool](repeating: true, count: limit + 1)
  isPrime[0] = false
  isPrime[1] = false

  if limit >= 4 {
    for number in 2...Int(sqrt(Double(limit))) {
      if isPrime[number] {
        for multiple in stride(from: number * number, through: limit, by: number) {
          isPrime[multiple] = false
        }
      }
    }
  }

  return (2...limit).filter { isPrime[$0] }
}