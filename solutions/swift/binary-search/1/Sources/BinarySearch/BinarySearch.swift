import Foundation

enum BinarySearchError: Error {
    case valueNotFound
}

class BinarySearch {
    let list: [Int]

    init(_ list: [Int]) {
        self.list = list
    }

    func searchFor(_ value: Int) throws -> Int {
        var low = 0
        var high = list.count - 1

        while low <= high {
            let mid = low + (high - low) / 2
            let guess = list[mid]

            if guess == value {
                return mid
            }

            if guess < value {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        throw BinarySearchError.valueNotFound
    }
}