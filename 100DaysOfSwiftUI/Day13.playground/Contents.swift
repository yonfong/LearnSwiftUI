import Cocoa

protocol Building {
    var rooms: Int {get}
    var cost: Int {get}
    var agent: String {get set}
    
    func summary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func summary() {
        print("house has \(rooms) rooms, it cost \(cost), the agent is \(agent)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agent: String
    
    func summary() {
        print("Office has \(rooms) rooms, it cost \(cost), the agent is \(agent)")
    }
}
