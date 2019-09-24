import Cocoa

var str = "Hello, playground"

//protocol someProtocol {
//
//}

class someSuperClass {
    
}

protocol FirstProtocol {
    
}

protocol AnotherProtocol1 {

}

//struct SomeStructure1 : someSuperClass, FirstProtocol, AnotherProtocol1 {
//
//}

protocol SomeProtocol1 {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol2 {
    static var someTypeProperty: Int { get set }
}

protocol fullyNamed {
    var fullName: String { get }
    
}

struct Person: fullyNamed {
    var fullName: String
}

let john = Person(fullName: "Shoko")

class Starship: fullyNamed {
    var prefix:String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "" ) + name
    }
    
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

protocol SomeProtocol {
    
    static func someTypeMethod()
    
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    
    var lastRamdom  = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRamdom = (lastRamdom * a + c).truncatingRemainder(dividingBy: m)
        return lastRamdom / m
    }
    
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        
        case .off:
            self = .on
        
        case .on:
            self = .off
            
        }
    }
}


var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

protocol SomeProtocol2 {
    init(somePrameter: Int)
}

class SomeClass1: SomeProtocol2 {
    required init(somePrameter: Int) {
        
    }
}

protocol SomeProtocol3 {
    init()
}

class SomeClass2 {
    init() {
        
    }
}

//class SomeSubClass: someSuperClass, SomeProtocol {
//    required override init(){
//
//    }
//}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Ramdom dice roll is \(d6.roll())")
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate : AnyObject{
    func gameDidStart (_ game: DiceGame )
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}


class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] += +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
     }
    
    weak var delegate: DiceGameDelegate?
    func play() {
       square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
                
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        
        delegate?.gameDidEnd(self)
    }
    
}

class DiceGameTracker: DiceGameDelegate {
    
    
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        
        print("The game is using a \(game.dice.sides) -sided dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

protocol TextRepresetable {
    var textualDescription: String { get }
}

extension Dice: TextRepresetable {
    var textualDescription: String {
        return "A \(sides) -sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
extension SnakesAndLadders: TextRepresetable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

extension Array: TextRepresetable where Element: TextRepresetable {
    var textualDescription: String {
        let itemsAstext = self.map {
            $0.textualDescription
        }
        return "[" + itemsAstext.joined(separator: ", ") + "]"
    }
}

let myDice = [d6, d12]
print(myDice.textualDescription)

struct Hamster {
    var name: String
    var texualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresetable {
    var textualDescription: String {
        <#code#>
    }
}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresetable: TextRepresetable = simonTheHamster
print(somethingTextRepresetable.textualDescription)

let things: [TextRepresetable] = [game, d12, simonTheHamster]
for thing in things {
    print(thing.textualDescription)
}

protocol InheritingProtocol: SomeProtocol, AnotherProtocol1 {
    
}


protocol PrettyTextRepresentable : TextRepresetable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
                case let ladder where ladder > 0:
                output += "up "
                case let snake where snake < 0:
                output += "down "
                default:
                output += "circle "
            }
        }
        
        return output
    }
}

print(game.prettyTextualDescription)

//protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
//
//}

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person1: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday (to celebrator: Named & Aged) {
    print("happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = Person1(name: "Rose", age: 25)
wishHappyBirthday(to: birthdayPerson)

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("hello, \(location.name)!")
}


let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [ Circle(radius: 2.0), Country(area: 243_610), Animal(legs: 4)]
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}


@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
    }
}
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator1 = LinearCongruentialGenerator()
print("Here's a random Number: \(generator1.random())")

print("And here's a random Boolean: \(generator1.randomBool())")

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        
        return true
}
}

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]

print(equalNumbers.allEqual())
print(differentNumbers.allEqual())
