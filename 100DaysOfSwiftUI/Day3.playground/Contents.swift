import Cocoa


let presidents = ["Bush", "Obama", "Trump", "Biden"]
print(presidents)
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

let set = Set([1,2,5,1,3])

// enums
//enum Weekday {
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
//}

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.friday
day = .monday
