// Write your code for the 'TwoFer' exercise in this file.

func twoFer(name: String? = nil) -> String {
    let person = name ?? "you"
    return "One for \(person), one for me."
}