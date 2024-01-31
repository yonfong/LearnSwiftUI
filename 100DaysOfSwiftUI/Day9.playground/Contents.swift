import Cocoa


func clean(tasks: () -> Void) {
    print("start to clean the house")
    tasks()
}

clean {
    print("clean table")
}
