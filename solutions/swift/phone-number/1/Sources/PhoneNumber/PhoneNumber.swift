enum PhoneNumberError: Error {
    case invalidPhoneNumber
}

class PhoneNumber {
    private let phoneNumber: String
    
    init(_ phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    func clean() throws -> String {
        let digits = phoneNumber.filter { $0.isNumber }
        
        guard digits.allSatisfy({ $0.isNumber }) else {
            throw PhoneNumberError.invalidPhoneNumber
        }
        
        let cleanedNumber: String
        
        switch digits.count {
        case 10:
            cleanedNumber = digits
        case 11:
            guard digits.first == "1" else {
                throw PhoneNumberError.invalidPhoneNumber
            }
            cleanedNumber = String(digits.dropFirst())
        default:
            throw PhoneNumberError.invalidPhoneNumber
        }
        
        guard cleanedNumber.count == 10 else {
            throw PhoneNumberError.invalidPhoneNumber
        }
        
        let areaCode = String(cleanedNumber.prefix(3))
        let exchangeCode = String(cleanedNumber.dropFirst(3).prefix(3))
        
        guard areaCode.first != "0" && areaCode.first != "1" else {
            throw PhoneNumberError.invalidPhoneNumber
        }
        
        guard exchangeCode.first != "0" && exchangeCode.first != "1" else {
            throw PhoneNumberError.invalidPhoneNumber
        }
        
        return cleanedNumber
    }
}