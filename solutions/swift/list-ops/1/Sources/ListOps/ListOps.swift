struct ListOps {
    static func append<T>(_ list1: [T], _ list2: [T]) -> [T] {
        var result = list1
        for item in list2 {
            result.append(item)
        }
        return result
    }

    static func concat<T>(_ lists: [[T]]) -> [T] {
        var result = [T]()
        for list in lists {
            for item in list {
                result.append(item)
            }
        }
        return result
    }

    static func filter<T>(_ list: [T], _ predicate: (T) -> Bool) -> [T] {
        var result = [T]()
        for item in list {
            if predicate(item) {
                result.append(item)
            }
        }
        return result
    }

    static func length<T>(_ list: [T]) -> Int {
        var count = 0
        for _ in list {
            count += 1
        }
        return count
    }

    static func map<T, U>(_ list: [T], _ transform: (T) -> U) -> [U] {
        var result = [U]()
        for item in list {
            result.append(transform(item))
        }
        return result
    }

    static func foldLeft<T, U>(_ list: [T], accumulated: U, combine: (T, U) -> U) -> U {
        var accumulator = accumulated
        for item in list {
            accumulator = combine(item, accumulator)
        }
        return accumulator
    }

    static func foldRight<T, U>(_ list: [T], accumulated: U, combine: (T, U) -> U) -> U {
        var accumulator = accumulated
        let len = length(list)
        if len > 0 {
            for i in 1...len {
                let item = list[len - i]
                accumulator = combine(item, accumulator)
            }
        }
        return accumulator
    }

    static func reverse<T>(_ list: [T]) -> [T] {
        var result = [T]()
        for item in list {
            result.insert(item, at: 0)
        }
        return result
    }
}