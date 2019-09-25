import UIKit

//protovcol:only use var
//property requirement
protocol FullyNamed{
    var fullName: String{get} // 1.Name, 2.Type, 3.Read only or read /write, 4.instance or type
}

struct Person: FullyNamed { // struct can not inherient
    //var fullName:String
    var fullName:String{
        return "aaa"
    }
}

//let john = Person(fullName: "John Applessed")
let A = Person()
A.fullName

class Starship: FullyNamed {
    var prefix:String?
    var name: String
    init(name:String,prefix:String? = nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName: String{
        return(prefix != nil ? prefix! + " ": "") + name
        //
    }
    
}

var ncc1701 = Starship(name:"Enterprise", prefix: "USS")
ncc1701.fullName


//method requirement
protocol RandomNumberGenerator{
    func random()-> Double  //1.instance/type 2.name 3. type 4.mutationg
}

class LinearCongruentiaGenerator: RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double{
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

let generator = LinearCongruentiaGenerator()
print("Here's random number: \(generator.random())")

class Dice{
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator ){
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int{
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides:6, generator: LinearCongruentiaGenerator())
for _ in 1...5{
    print("Random dice roll is \(d6.roll())")
}

//mutating protocol requirment
protocol togglable{
    mutating func toggle()
}

enum onoffswitch{
    case on,off
    mutating func toggle() {
        switch self{
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}
var S_on = onoffswitch.on
S_on.toggle()

//initializer
protocol SomeProtocal{
    init(Someparameter:Int)
}
class testClass:SomeProtocal{
    required init(Someparameter:Int) { //must add required init
        
    }
}


//Delegation 1.communication pattern 2. Between two instance 3. Blind communication: don't care whom communicate with
protocol DiceGame{
    var dice: Dice{get}
    func play()
}

protocol DiceGameDelegates:AnyObject{  //class-only
    func gameDidStart(_ game: DiceGame)
    func game(_ game:DiceGame,didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakeAndLadders:DiceGame{
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentiaGenerator()) // have to add () after LinearCongruentiaGenerator
    var square = 0
    var board:[Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08
        board[06] = +11
        board[09] = +09
        board[10] = +02
        board[14] = -10
        board[19] = -11
        board[22] = -02
        board[24] = -08
    }
    // optional delegate protocol (weak)
    weak var delegate: DiceGameDelegates?
    
    func play() {
        square = 0
        delegate?.gameDidStart(self) //self means SnakeAndLadders(as a delegate protocol parameter)
        
        gameLoop: while square != finalSquare{
            //gameLoop is the name of while loop
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            
            switch square + diceRoll{
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

class DiceGameTraker: DiceGameDelegates { // have to add space between type name and {}
    var numberOfTurns = 0
    
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakeAndLadders {
            print("STart a new game of Snakes and Ladders")
            print("The game is using a \(game.dice.sides)-sided dice")
        }
    }
    
    func game(_ game:DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int){
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game:DiceGame){
        print("The game lasted for \(numberOfTurns) turns")
    }
    
}
let tracker = DiceGameTraker()
let game = SnakeAndLadders()
game.delegate = tracker   //do not forget
game.play()

//Add protocol into extension
protocol TextRepresentable{
    var textd: String{ get }
}

extension Dice: TextRepresentable{
    var textd: String{
        return "A \(sides)-sided dice"
    }
}
let textDice = Dice(sides: 12 , generator: LinearCongruentiaGenerator())
textDice.textd

extension Array: TextRepresentable where Element: TextRepresentable {
    var textd: String {
        let itemAsText = self.map{ $0.textd }
        return "[" + itemAsText.joined(separator: ", ") + "]"
    }
}
var d12 = Dice(sides:12, generator: LinearCongruentiaGenerator())
let myDice = [d6, d12]
print(myDice.textd)

extension SnakeAndLadders:TextRepresentable{
    var textd: String{
        return "A game with \(finalSquare) squares"
    }
}
//Declareing protocol adoption with an extension
struct Hamster{
    var name: String
    var textd:String{
        return "Name: \(name)"
    }
}
extension Hamster: TextRepresentable{}
let sim = Hamster(name: "Simon")
let somethingTextRepresentable:TextRepresentable = sim
print(somethingTextRepresentable.textd)

// Collection of protocol
let things:[TextRepresentable] = [game,d12,sim]
for thing in things{
    print(thing.textd)
}
//Protocol Inheritance
protocol PrettyTextRepesentable: TextRepresentable{
    var prettyTextualDescription: String{ get }
}

//protocal conposition
protocol Named{
    var name: String{get}
}
protocol Aged {
    var age: Int{get}
}
struct Person1 : Named, Aged{
    var name: String
    var age: Int
}
func wishhappyBirthday(to celebrator: Named & Aged){
    print("HB \(celebrator.name), age:\(celebrator.age)")
}

let BDperson = Person1(name: "Linn", age: 23)
wishhappyBirthday(to: BDperson)

class Location{
    var latitude:Double
    var longitude:Double
    init(latitude:Double, longitude:Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}
class City: Location, Named{
    var name: String
    init(name: String, latitude: Double, longitude:Double) {
        self.name=name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named){
    print("Hello,\(location.name)!")
}
let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)


protocol HasArea {
    var area: Double{get}
}
class Circle: HasArea{
    let pi = 3.14159
    var radius:Double
    var area: Double{ return pi * radius * radius}
    init(radius:Double) {
        self.radius = radius
    }
}

class Country: HasArea{
    var area: Double
    init(area: Double){self.area = area}
}

class Animal{
    var legs: Int
    init(legs:Int){self.legs = legs}
}
let objects:[AnyObject] = [Circle(radius:2.0), Country(area: 234_610), Animal(legs: 4)]

for object in objects{
    if let objectWithArea = object as? HasArea{
        print("Area is \(objectWithArea.area)")
    }else{
        print("Somthing that doesn't have an area")
    }
}

// Optional Protocol Requirements
@objc protocol CounterDataSource{
    @objc optional func increment(forCount count:Int)->Int
    @objc optional var fixedIncrement:Int{get}
}
class Counter{
    var count = 0
    var dataSource:CounterDataSource?
    func incremence(){
        if let amount = dataSource?.increment?(forCount:count){
            count += amount
        }else if let amount = dataSource?.fixedIncrement{
            count += amount
        }
    }
}

class ThreeSource: CounterDataSource{
        let fixedIncrement = 3
}
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4{
    counter.incremence()
    print(counter.count)
}

class TowardsZeroSource: CounterDataSource{
    func increment(forCount count: Int) -> Int {
        if count == 0{
            return 0
        }else if count < 0{
            return 1
        }else{
            return -1
        }
    }
}
counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5{
    counter.incremence()
    print(counter.count)
}

extension RandomNumberGenerator{
    func randomBool() -> Bool{
        return random() > 0.5
    }
}
let generator2 = LinearCongruentiaGenerator()
print("a random number:\(generator2.random())")
print("a random boolean: \(generator2.randomBool())")

extension PrettyTextRepesentable{
    var prettyTextualDiscription: String{
        return textd
    }
}
//Adding Constraints in protocol
extension Collection where Element:Equatable{
    func allEqual() -> Bool{
        for element in self{
            if element != self.first{
                return false
            }
        }
        return true
    }
}
let equalNumbers = [100,100,100,100,100]
let differentNumbers = [100,100,200,100,200]
print(equalNumbers.allEqual())
print(differentNumbers.allEqual())
