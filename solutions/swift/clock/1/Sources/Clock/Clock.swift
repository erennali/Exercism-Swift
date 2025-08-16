import Foundation

struct Clock: Equatable {
    let hours: Int
    let minutes: Int

    init(hours: Int = 0, minutes: Int = 0) {
        let minutesInADay = 24 * 60
        let totalMinutes = hours * 60 + minutes
        
        let normalizedMinutes = (totalMinutes % minutesInADay + minutesInADay) % minutesInADay
        
        self.hours = normalizedMinutes / 60
        self.minutes = normalizedMinutes % 60
    }

    var description: String {
        String(format: "%02d:%02d", self.hours, self.minutes)
    }

    func add(minutes: Int) -> Clock {
        Clock(hours: self.hours, minutes: self.minutes + minutes)
    }

    func subtract(minutes: Int) -> Clock {
        Clock(hours: self.hours, minutes: self.minutes - minutes)
    }
}