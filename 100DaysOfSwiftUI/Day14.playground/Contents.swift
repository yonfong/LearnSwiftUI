import Cocoa

func randomItem(in array:[Int]?) -> Int {
    return array?.randomElement() ?? Int.random(in: 1...100)
}

let random = randomItem(in: nil)
print(random)

