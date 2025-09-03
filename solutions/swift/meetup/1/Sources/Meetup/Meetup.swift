import Foundation

class Meetup {
    let description: String

    init(year: Int, month: Int, week: String, weekday: String) {
        let calendar = Calendar.current
        let targetWeekday = Self.weekdayToInt(weekday)
        let allMatchingDays = Self.findAllOccurrences(
            of: targetWeekday, inMonth: month, ofYear: year, using: calendar
        )

        var resultDate: Date?
        switch week.lowercased() {
        case "first":
            resultDate = allMatchingDays[0]
        case "second":
            resultDate = allMatchingDays[1]
        case "third":
            resultDate = allMatchingDays[2]
        case "fourth":
            resultDate = allMatchingDays[3]
        case "last":
            resultDate = allMatchingDays.last
        case "teenth":
            resultDate = allMatchingDays.first {
                (13...19).contains(calendar.component(.day, from: $0))
            }
        default:
            fatalError("Invalid week specifier")
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.description = formatter.string(from: resultDate!)
    }

    private static func findAllOccurrences(of weekday: Int, inMonth month: Int, ofYear year: Int, using calendar: Calendar) -> [Date] {
        var components = DateComponents(year: year, month: month)
        guard let firstOfMonth = calendar.date(from: components),
            let range = calendar.range(of: .day, in: .month, for: firstOfMonth)
        else {
            return []
        }

        return range.compactMap { day in
            components.day = day
            guard let date = calendar.date(from: components) else { return nil }
            return calendar.component(.weekday, from: date) == weekday ? date : nil
        }
    }

    private static func weekdayToInt(_ weekday: String) -> Int {
        let weekdays = [
            "sunday": 1, "monday": 2, "tuesday": 3, "wednesday": 4,
            "thursday": 5, "friday": 6, "saturday": 7,
        ]
        return weekdays[weekday.lowercased()]!
    }
}