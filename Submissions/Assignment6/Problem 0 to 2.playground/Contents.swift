import UIKit

// Problem 0

protocol SomeProtocol {
    var mustBeSettable: Int {get set}
    var doesNotNeedToBeSettable: Int {get}
}

protocol AnotherProtocol {
    static var someTypeProperty: Int {get set}
}

protocol FullyNamed {
    var fullName: String {get}
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
print(john.fullName)

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise")
var ncc1702 = Starship(name: "Enterprise", prefix: "BRA")

print(ncc1701.fullName)
print(ncc1702.fullName)

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.3746499199817101"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283”

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
// lightSwitch is now equal to .on


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
    print("Random dice roll is \(d6.roll())")
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
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
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
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
        print("The game is using a \(game.dice.sides)-sided dice")
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

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}


// Problem 1

protocol someProtocol1 {
    var property1: Int {get}
    var property2: String {get set}
    var property3: (() -> Int)? {get}
    static var property4: String? {get set}
    
    static func method1(arg param: Int)
    func method2(arg param: Int) -> Int?
    mutating func method3() -> String?
}

class Class1: someProtocol1 {
    var property1: Int
    var property2: String
    var property3: (() -> Int)?
    static var property4: String?
    
    init(property1 : Int, property2: String, property3: (() -> Int)?) {
        self.property1 = property1
        self.property2 = property2
        self.property3 = property3
    }
    
    static func method1(arg param: Int) {
        let result = param * param
        print(result)
    }
    
    func method2(arg param: Int) -> Int? {
        return param
        
    }
    
    func method3() -> String? {
        return "Hello Word"
    }
}

struct Struct1: someProtocol1 {
    var property1: Int
    var property2: String
    var property3: (() -> Int)?
    static var property4: String?
    
    init(property1 : Int, property2: String, property3: (() -> Int)?) {
        self.property1 = property1
        self.property2 = property2
        self.property3 = property3
    }
    
    static func method1(arg param: Int) {
        let result = param * param
        print(result)
    }
    
    func method2(arg param: Int) -> Int? {
        return param
        
    }
    
    func method3() -> String? {
        return "Hello Word"
    }
}

enum Enum1: someProtocol1 {
    var property1: Int {
        get {
            let number = 2
            return number
        }
    }
    
    var property2: String {
        get {
            let number = property1
            return String(number)
        
        }
        set {
            print("Property 2 is being set")
        }
    }
    
    var property3: (() -> Int)? {
        get {
            return {() -> Int in self.property1}

            }
        }
    
    static var property4: String? {
        get {
            return "Hello I'm a Enum!"
        }
        set {
        }
    }
    
    static func method1(arg param: Int) {
        let result = param * param
        print(result)
    }
    
    func method2(arg param: Int) -> Int? {
        return param
        
    }
    
    func method3() -> String? {
        return "Hello Word"
    }
    
    
}

// Problem 2

class CarRepairServiceProvider {
    let issueDescription: String
    let carModel: String
    
    init(issue: String, model: String) {
        self.issueDescription = issue
        self.carModel = model
    }
}

class HomeServiceProvider {
    let serviceType: String
    let address: String
    
    init(serviceType: String, address: String) {
        self.address = address
        self.serviceType = serviceType
    }
}

class StudentServicesProvider {
    let serviceDescription: String
    init(description: String) {
        self.serviceDescription = description
    }
}

class ClientA {
    let service: CarRepairServiceProvider
    
    init(service: CarRepairServiceProvider) {
        self.service = service
    }
}

class ClientB {
    let service: HomeServiceProvider
    
    init(service: HomeServiceProvider) {
        self.service = service
    }
}

class ClientC {
    let service: StudentServicesProvider
    
    init(service: StudentServicesProvider) {
        self.service = service
    }
}

protocol Service : AnyObject {
    func provideService() -> Void
}

extension CarRepairServiceProvider: Service {
    func provideService() {
        print("\(self.issueDescription) fix is being provided to car \(self.carModel).")
    }
}

extension HomeServiceProvider: Service {
    func provideService() {
        print("\(self.serviceType) is being provided at \(self.address).")
    }
}

extension StudentServicesProvider: Service {
    func provideService() {
        print("Service of \(self.serviceDescription) is being provided to student.")
    }
}

class ClientD {
    let services: [Service]
    
    init(services: [Service]) {
        self.services = services
    }
}


enum HomeService: String {
    case CookingService = "Cooking Service"
    case WashingService = "Washing Service"
    case BabySittingService = "Baby Sitting Service"
}


let firstClient = ClientA(service: CarRepairServiceProvider(issue: "Oil Leaking", model: "Toyota Supra"))
firstClient.service.provideService()
let secondClient = ClientB(service: HomeServiceProvider(serviceType: HomeService.CookingService.rawValue, address: "12345 Amazing Street"))
secondClient.service.provideService()
let thirdClient = ClientC(service: StudentServicesProvider(description: "Tutoring"))
thirdClient.service.provideService()
let forthClient = ClientD(services: [StudentServicesProvider(description: "Math tutoring"), CarRepairServiceProvider(issue: "Charging not working", model: "Tesla S" ), HomeServiceProvider(serviceType: HomeService.WashingService.rawValue, address: "12345 Vancouver Street")])

for service in forthClient.services {
    service.provideService()
}

