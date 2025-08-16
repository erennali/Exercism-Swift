import Foundation

func gigasecond(from: Date) -> Date {
 let gigaseconds: TimeInterval = 1_000_000_000
 return from.addingTimeInterval(gigaseconds)
}
