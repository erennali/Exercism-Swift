func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
    guard !inMultiples.isEmpty else { return 0 }

    let uniqueMultiples = (1..<limit).filter { number in
        inMultiples.contains { multiple in
            multiple != 0 && number % multiple == 0
        }
    }
    
    return uniqueMultiples.reduce(0, +)
}