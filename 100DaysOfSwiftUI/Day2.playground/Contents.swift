import Cocoa

// Boolean
var hasDogs = true
var gameOver = false

let isMultiple = 57.isMultiple(of: 3)

var isSkiped = false
print(isSkiped)

isSkiped = !isSkiped
print(isSkiped)

gameOver.toggle()
print(gameOver)

//checkpoint1
let celsiusTemperature = 26.0

let fahrenheitTemperature = celsiusTemperature * 9 / 5 + 32

print("temperature in Celsius: \(celsiusTemperature), fahrenheit: \(fahrenheitTemperature)")
