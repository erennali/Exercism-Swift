class GradeSchool {
    private var studentRoster: [Int: [String]] = [:]

    func addStudent(_ name: String, grade: Int) -> Bool {
        if studentRoster.values.flatMap({ $0 }).contains(name) {
            return false
        }
        studentRoster[grade, default: []].append(name)
        studentRoster[grade]?.sort()
        return true
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        return studentRoster[grade] ?? []
    }

    func roster() -> [String] {
        return studentRoster.keys.sorted().flatMap { studentRoster[$0]! }
    }
}