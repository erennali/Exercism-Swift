
func flattenArray<T>(_ array: [Any?]) -> [T] {
    var flattened: [T] = []
    for element in array {
        if let subArray = element as? [Any?] {
            flattened.append(contentsOf: flattenArray(subArray))
        } else if let value = element as? T {
            flattened.append(value)
        }
    }
    return flattened
}