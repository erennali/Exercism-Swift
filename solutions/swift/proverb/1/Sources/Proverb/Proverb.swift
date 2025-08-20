class Proverb {
    var inputList: [String] = []
    
    init(_ inputList: [String]) {
        self.inputList = inputList
    }
    
    func recite() -> String {
        guard !inputList.isEmpty else { return "" }
        
        if inputList.count == 1 {
            return "And all for the want of a \(inputList[0])."
        }
        
        var lines: [String] = []
        
        for index in 0..<inputList.count-1 {
            lines.append("For want of a \(inputList[index]) the \(inputList[index+1]) was lost.")
        }
        
        lines.append("And all for the want of a \(inputList[0]).")
        
        return lines.joined(separator: "\n")
    }
}