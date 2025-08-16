import Foundation

func isArmstrongNumber(_ number: Int) -> Bool {
    let numberString = String(number)
    let count = numberString.count
    var sum = 0

    for char in numberString {
        let digit = char.wholeNumberValue! 
        sum += Int(pow(Double(digit), Double(count)))
    }

    return sum == number
}