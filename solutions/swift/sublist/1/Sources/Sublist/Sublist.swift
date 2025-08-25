enum SublistResult {
    case equal, sublist, superlist, unequal
}

func classifier(listOne: [Int], listTwo: [Int]) -> SublistResult {
    if listOne == listTwo {
        return .equal
    }
    if isContained(listOne, by: listTwo) {
        return .sublist
    }
    if isContained(listTwo, by: listOne) {
        return .superlist
    }
    return .unequal
}

private func isContained(_ sublist: [Int], by superlist: [Int]) -> Bool {
    guard !sublist.isEmpty else { return true }
    guard sublist.count <= superlist.count else { return false }

    for i in 0...(superlist.count - sublist.count) {
        let endIndex = i + sublist.count
        let slice = superlist[i..<endIndex]
        
        if slice.elementsEqual(sublist) {
            return true
        }
    }
    
    return false
}