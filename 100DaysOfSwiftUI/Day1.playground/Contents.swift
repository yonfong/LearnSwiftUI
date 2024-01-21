import Cocoa

// variable and constant
var greeting = "Hello, playground"
print(greeting)

greeting = "hello swift"
print(greeting)

var name = "blue sky"
name = "yongfeng"
print(name)

let someOne = "can not changed"
//someOne = "change error"
print(someOne)

//string

let actor = "Andy Liu"
let filename = "test.mp3"

let quote = "Then he tapped a sign saying \"Believe\" and walked away"

let movie = """
A day in
the life of an
Apple engineer
"""

print(movie.count)

let movieLength = movie.count

print(movie.uppercased())

print(movie.hasPrefix("a day"))
print(filename.hasSuffix(".mp3"))

let fruit: String = "apple"

// store numbers
let score = 10
var reallyBig = 100000000
reallyBig = 100_00_00_000
reallyBig = 1_00__000_00000

let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let squaredScore = score * score

var counter = 10
counter = counter + 5
counter = counter - 10

counter += 8
counter *= 2
counter -= 6
counter /= 3

let number = 120
print(number.isMultiple(of: 3))

//decimal numbers
let decimalNumber = 0.1 + 0.2
print(decimalNumber)



