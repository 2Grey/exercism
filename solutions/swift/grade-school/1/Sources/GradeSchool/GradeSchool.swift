class GradeSchool {
    var roster: [Int: [String]] = [:]

    func addStudent(_ name: String, grade: Int) {
        self.roster[grade] = (self.roster[grade] ?? []) + [name]
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        self.roster[grade] ?? []
    }

    var sortedRoster: [Int: [String]] {
        var result: [Int: [String]] = [:]
        for k in self.roster.keys {
            result[k] = self.roster[k]?.sorted(by: <)
        }
        return result
    }
}
