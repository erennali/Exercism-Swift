class Year {
    let year: Int

    init(calendarYear: Int) {
        self.year = calendarYear
    }

    var isLeapYear: Bool { 
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
    }
}