import Foundation

enum BaseError: Error {
    case invalidInputBase
    case invalidOutputBase
    case negativeDigit
    case invalidPositiveDigit
}

struct Base {
  static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
    guard inputBase >= 2 else { throw BaseError.invalidInputBase }
    guard outputBase >= 2 else { throw BaseError.invalidOutputBase }

    var decimalValue = 0
    for digit in inputDigits {
      guard digit >= 0 else { throw BaseError.negativeDigit }
      guard digit < inputBase else { throw BaseError.invalidPositiveDigit }
      decimalValue = decimalValue * inputBase + digit
    }

    if decimalValue == 0 {
      return [0]
    }

    var result: [Int] = []
    var number = decimalValue
    while number > 0 {
      result.append(number % outputBase)
      number /= outputBase
    }

    return result.reversed()
  }
}