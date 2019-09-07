//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Counter {
    var count = 0 // instance property
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    func reset(){
        count = 0
    }
    
    
    // You need to use self in order to differentiate between count as an instance property and cout as local value
    func jumpCount(by count: Int){
        // self.count means variable in line 8
        // count without self is prameter of this func
        self.count = self.count * count
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()


struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0){
    print("This point is to the right of the line where x == 1.0")
    
}

struct Point2 {
    var x = 0.0, y = 0.0
    
    // moveBy and moveBy2 do same thing
    mutating func moveBy(x deltaX: Double, y deltaY:Double){
        x += deltaX
        y += deltaY
    }
    
    mutating func moveBy2(x deltaX: Double, y deltaY:Double){
        // don't make sense self in this case
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}

// it has to be variable
var somePoint2 = Point2(x:1.0, y:1.0)
somePoint2.moveBy(x:2.0, y:3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
enum TriStateSwitch{
    case off, low, high

    mutating func next(){
        switch self {

        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()

struct LevelTracker {
    // static can share this variable
    // if static was attached child class can refer to the variable below
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level:Int){
        if level > highestUnlockedLevel
        {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    
    @discardableResult
    mutating func advance(to level:Int) -> Bool {
        if LevelTracker.isUnlocked(level){
            // why mutating? cuz currentLevel is instace property in levelTracker
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int){
        // cuz unlock is static
        // if you want to use static method you have to use the original name of method.
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrio")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}

