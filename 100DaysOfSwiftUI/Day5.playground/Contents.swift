import Cocoa

let score = 85

if score > 80 {
    print("great job")
}


enum Weekday {
    case monday, tuesday, wednesday, thirsday, friday
}

let day = Weekday.tuesday

switch day {
case .monday:
    print("hello")
    fallthrough
case .tuesday:
    print("wow")
    fallthrough
case .wednesday:
    print("good")
    fallthrough
case .thirsday:
    print("nice")
    fallthrough
case .friday:
    print("end")
}

let endOfweek = day == .friday ? true : false
