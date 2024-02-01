import Cocoa

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("barking")
    }
}

class Cat: Animal {
    var isTame: Bool
    func speak() {
        print("miao")
    }
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corgi barking")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodle barking")
    }
}

class Persian: Cat {
    override func speak() {
        print("Persian miao")
    }
}

class Lion: Cat {
    override func speak() {
        print("Lion miao")
    }
}
