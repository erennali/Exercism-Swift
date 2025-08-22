extension Array {
    func keep(_ predicate: (Element) -> Bool) -> [Element] {
        var keptElements: [Element] = []
        for element in self {
            if predicate(element) {
                keptElements.append(element)
            }
        }
        return keptElements
    }

    func discard(_ predicate: (Element) -> Bool) -> [Element] {
        var discardedElements: [Element] = []
        for element in self {
            if !predicate(element) {
                discardedElements.append(element)
            }
        }
        return discardedElements
    }
}