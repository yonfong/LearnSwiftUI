import Cocoa

let testItems = ["write", "some", "code", "number", "code"]
print(testItems.count)

var uniqueItems = [String]()
for item in testItems {
    if uniqueItems.contains(item) {
        continue
    } else {
        uniqueItems.append(item)
    }
}

print(uniqueItems)
print(uniqueItems.count)

let convertedSet = Set(testItems)
print(convertedSet.count)
