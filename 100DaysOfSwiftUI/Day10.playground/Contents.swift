import Cocoa

struct User {
    var name: String
    var age: Int
    
    mutating func growBy(year: Int) {
        age += year
    }
}

var zhangsan = User(name: "zhangsan", age: 8)
zhangsan.growBy(year: 3)

print(zhangsan.age)


struct InitialTest {
    var test: Int {
        didSet {
            print("InitialTest -> \(test)")
        }
    }
}

var test = InitialTest(test: 4)
test.test = 5
