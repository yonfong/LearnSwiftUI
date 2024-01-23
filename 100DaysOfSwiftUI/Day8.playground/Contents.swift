import Cocoa


func displayName(name: String, hasPrefix: Bool = false) {
    if hasPrefix {
        print("hello \(name)")
    } else {
        print(name)
    }
}

displayName(name: "zhangsan")

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else if password.count < 15 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print(result)
} catch {
    print("error")
}

do {
    let result = try checkPassword(string)
    print(result)
} catch PasswordError.short {
    print("short")
} catch PasswordError.obvious {
    print("obvious")
} catch {
    print("error")
}

enum SqrtError: Error {
    case outOfBounds, noRoot
}

func mysqrt(number: Int) throws -> Int {
    
    if number < 1 || number > 10000 {
        throw SqrtError.outOfBounds
    }
    
    let sqrt = Int(sqrt(Double(number)))
    
    var find = false
    for root in 1...sqrt {
        if root * root == number {
            find = true
            break
        }
    }
    
    if find {
        return Int(sqrt)
    } else {
        throw SqrtError.noRoot
    }
}

let number = 4
do {
    let root = try mysqrt(number: number)
    print(root)
} catch {
    print(error.localizedDescription)
}


