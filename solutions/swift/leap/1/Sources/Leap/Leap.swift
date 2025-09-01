struct Year {
    let calendarYear: Int

    var isLeapYear: Bool {
        if self.calendarYear % 400 == 0 { return true }
        if self.calendarYear % 100 == 0 { return false }
        if self.calendarYear % 4 == 0 { return true }
        return false
    }
}
