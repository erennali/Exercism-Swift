enum ClassificationError: Error {
    case invalidInput
}

enum Classification {
    case perfect
    case abundant
    case deficient
}

func classify(number: Int) throws -> Classification {
    guard number > 0 else { throw ClassificationError.invalidInput }
    
    if number == 1 { return .deficient }
    
    var sum = 1
    let sqrt = Int(Double(number).squareRoot())
    
    if sqrt >= 2 {
        for sqrtNum in 2...sqrt {
            if number % sqrtNum == 0 {
                sum += sqrtNum
                if sqrtNum != number / sqrtNum { sum += number / sqrtNum }
            }
        }
    }
    
    if sum == number { return .perfect }
    else if sum > number { return .abundant }
    else { return .deficient }
}