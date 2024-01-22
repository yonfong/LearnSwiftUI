import Cocoa

let filenames = ["audio.mp3", "video.mp4", "image.jpeg", "image.png"]

for filename in filenames {
    if filename.hasSuffix(".mp3") {
        continue
    }
    
    print(filename)
}

for filename in filenames {
    if filename.hasSuffix(".jpeg") {
        break
    }
    print(filename)
}

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Bizz")
    } else {
        print(i)
    }
}
