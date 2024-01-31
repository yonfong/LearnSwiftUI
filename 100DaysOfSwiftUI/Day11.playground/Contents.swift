import Cocoa

struct User {
    var name: String
    private(set) var age: Int
    
    mutating func addBy(years: Int) {
        age += years
    }
}

var zhangsan = User(name: "zhangsan", age: 18)
zhangsan.addBy(years: 3)

struct Car {
    let model: String
    let seats: Int = 5
    private(set) var gears = Set<String>()
    
    mutating func addGear(_ gear: String) {
        gears.insert(gear)
    }
    
    mutating func removeGear(_ gear: String) {
        gears.remove(gear)
    }
}

