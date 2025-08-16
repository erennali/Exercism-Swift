import Foundation

enum CircularBufferError: Error {
    case bufferEmpty
    case bufferFull
}

struct CircularBuffer {
    private var storage: [Int?]
    private let capacity: Int
    private var readIndex = 0
    private var writeIndex = 0
    private var count = 0

    init(capacity: Int) {
        self.capacity = capacity
        self.storage = .init(repeating: nil, count: capacity)
    }

    mutating func read() throws -> Int {
        guard count > 0 else {
            throw CircularBufferError.bufferEmpty
        }
        let element = storage[readIndex]!
        storage[readIndex] = nil
        readIndex = (readIndex + 1) % capacity
        count -= 1
        return element
    }

    mutating func write(_ element: Int) throws {
        guard count < capacity else {
            throw CircularBufferError.bufferFull
        }
        storage[writeIndex] = element
        writeIndex = (writeIndex + 1) % capacity
        count += 1
    }

    mutating func overwrite(_ element: Int) {
        if count < capacity {
            try? write(element)
        } else {
            storage[readIndex] = element
            readIndex = (readIndex + 1) % capacity
        }
    }
    
    mutating func clear() {
        storage = .init(repeating: nil, count: capacity)
        readIndex = 0
        writeIndex = 0
        count = 0
    }
}