import Foundation

class Robot {
    var name: String

    init() {
        self.name = NameRegistry.shared.getNewName()
    }

    func resetName() {
        NameRegistry.shared.releaseName(self.name)
        self.name = NameRegistry.shared.getNewName()
    }
}

private class NameRegistry: @unchecked Sendable {
    static let shared = NameRegistry()
    private let lock = NSLock()
    private var usedNames = Set<String>()

    private init() {}

    func getNewName() -> String {
        lock.lock()
        defer { lock.unlock() }

        var newName: String
        repeat {
            let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            let randomLetters = String((0..<2).map { _ in letters.randomElement()! })
            let randomNumbers = String(format: "%03d", Int.random(in: 0...999))
            newName = randomLetters + randomNumbers
        } while usedNames.contains(newName)

        usedNames.insert(newName)
        return newName
    }

    func releaseName(_ name: String) {
        lock.lock()
        defer { lock.unlock() }
        usedNames.remove(name)
    }
}