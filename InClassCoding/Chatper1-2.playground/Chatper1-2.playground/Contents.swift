import UIKit

let maximumNumberOfLoginAttempts = 10  //to define a constant
var currentLoginAttempt = 0  //to define a variable

var x = 1.0
var y = 2.0
var z = 3.0

var x1 = 1.0, y1 = 2.0, z1 = 3.0

var x2 : Double = 10.0
var k : Int = 10
let c : Int = 1000
var y2 : Float = 8.0

var uk : UInt = 10
var uk8 : UInt8 = 206
var ik8 : Int8 = 20

var ik16 : Int64

var b1 = true
let b2 : Bool = true
b1 = false

var word : String = "Swift"
var word1 = "Swift"

print(word1)
print(b1)

print("The current language we are learning is \(word)")
print("This is a boolean \(b1) and this is a string \(word) and this is an integer \(uk8)")


print(word1); print(b1)

print ("Min UInt8 is \(UInt8.min) and max UInt8 is \(UInt8.max)")
print ("Min UInt16 is \(UInt16.min) and max UInt16 is \(UInt16.max)")
print("Min Int32 is \(Int32.min) and max Int32 is \(Int32.max)")

//Working with tuples

let http404Error1 = (404, "Not Found")
print(http404Error1)
print(http404Error1.0)
print(http404Error1.1)


let (code, message) = (404, "Not Found")
print(code)
print(message)

let (code1, message1) = http404Error1

print(code1)
print(message1)

let http404Error2 = (code:404, message:"Not Found")
print(http404Error2.code)
print(http404Error2.message)

var stringNumber = "123"
var number : Int? = Int(stringNumber)

//Optionals
//Forced unwrapping

if number != nil{
    let sum = number! + 10
    print(sum)
}

//Optional Binding
if let num = number {
    let sum = num + 10
    print(sum)
}
//Optinal variables has two states: value less or with value
//Implicitly unwrapped optional
var statement1 : String?  //Optinal String
var statement2 : String!  //Implicitly Unwrapped Optinal String
statement1 = "Ali"
statement2 = "Ali"

//forced unwrapping of statement1
if statement1 != nil {
    print(statement1!)
}

//optinal binding of statement 1
if let st1 = statement1 {
    print(st1)
}

//directly use of statement2
print(statement2!)

//forced unwrapping of statement2
if statement2 != nil {
    print(statement2!)
}

//optional binding of statement2
if let st2 = statement2 {
    print(st2)
}


let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight)

let a :Int? = nil
let b = 10
var s = (a ?? b)
print("s is \(s)")

//forced unwrapping
if a != nil {
    s = a!
} else {
    s = b
}
print("s is \(s)")

if let s = a {
    print("s is \(s)")
} else {
    s = b
    print("s is \(s)")
}

for index in 1...5 {
    print ("index is \(index)")
}


for index1 in 1...10 {
    for index2 in 1...10 {
        print("\(index2)*\(index1)=\(index1*index2)", terminator:" | ")
    }
    print("\n")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count

for i in 0..<count {  //equals to 0...count-1
    print(names[i])
}

for name in names[2...] {
    print(name)
}
for name in names[...2] {
    print(name)
}


let string1 = "hello"
let string2 = "there"
var welcome = string1 + string2
print(welcome)

let exclamationMark : Character = "!"
welcome.append(exclamationMark)

print(welcome)

let array1: Array<Int> = []
let array2: [Int] = [Int]()
let array3:Array<Int> = Array<Int>()
let array4: [Int] = Array<Int>()
let array5:Array<Int> = [Int]()

var set : Set<String> = ["A", "B", "C", "D", "D", "F"]
print(set)


var shoppingList : [String] = ["Eggs", "Milk"]
shoppingList.append("Flour")
shoppingList+=["Baking Powder"]
shoppingList+=["Chocolate Spread", "Cheese", "Butter"]

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index+1): \(value)")
}


var letters = Set<Character>()
print("letter is of type Set<Character> with \(letters.count) item.")
letters.insert("a")
letters.insert("b")

var favoriteGeners : Set<String> = ["Rock", "Classical", "Hiip hop"]
var arrayFavoriteGeners = ["Rock", "Classical", "Hiip hop"]
//print(favoriteGeners[0]) //wrong because favoriteGeners is a set
print(arrayFavoriteGeners[0])  //correct because arrayFavoriteGeners is an array

if let removedGenre = favoriteGeners.remove("Rock") {
    print(removedGenre)
} else {
    print("does not exist")
}

for genre in favoriteGeners {
    print("\(genre)")
}

let oddDigits : Set = [1,3,5,7,9]
let evenDigits : Set = [0,2,4,6,8]
let singleDigitPrimeNumbers : Set = [2,3,5,7]

print(oddDigits.union(evenDigits).sorted())
print(oddDigits.intersection(evenDigits).sorted())
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers))

//Question: There are 2 arrays of integers, called list1 and list2. list1 and list2 they all have the same numbers except one number that is only belongs to either list1 or list2. Find that number and which list the number belongs to.

let list1 : Array<Int> = [1,3,4,5,-9,90,7]
let list2 : Array<Int> = [1,3,4,6,5,-9,7]

let set1 = Set<Int>(list1)
let set2 = Set<Int>(list2)

let result = set1.symmetricDifference(set2)

for item in result {
    if set1.contains(item) {
        print("\(item) belongs to set1")
    } else if set2.contains(item) {
        print("\(item) belongs to set2")
    }
}

var namesOfIntegers = [Int:String]()
var airports: [String:String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airports)
airports["LHR"] = "London"
print(airports)

if let value = airports.updateValue("Ali Airport", forKey: "YYZ") {
    print("Old value is \(value)")
    print("new value is \(airports["YYZ"]!)")
} else {
    print("CICCC Does not exist")
}

for (key,value) in airports {
    print("\(key) : \(value)")
}

//Chapter: Control Flow

//Value binding
let anotherPoint = (2,0)

switch anotherPoint {
case (let x, 0):
    print("X=\(x)")
case (0, let y):
    print("Y=\(y)")
case (let x, let y):
    print("X=\(x) and Y=\(y)")
}


func greet (person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)")

    guard let location = person["location"] else {
        return
    }

    print("Hello \(location)")
}

greet(person:["name":"john"])
greet(person:["name":"jane", "location":"cupertino"])


func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
    //printAndCount(string: string)
}


func findMinMax(inList array:[Int]) -> (min:Int, max:Int) {
    var currentMin = array[0]
    var currentMax = array[0]

    for value in array[1..<array.count] {
        if value<currentMin {
            currentMin = value
        } else if(value>currentMax) {
            currentMax = value
        }
    }

    return (currentMin, currentMax)
}

let res1: (min: Int, max: Int) = findMinMax(inList:[1,2,5,6,7,8,9,10])
print("min is \(res1.min) and max is \(res1.max)")

let res2 = findMinMax(inList:[1,2,5,6,7,8,9,10])
print("min is \(res2.0) and max is \(res2.1)")

func arithmaticMean(_ numbers: Double...) -> Double {

    var total : Double = 0
    for number in numbers {
        total += number
    }

    return total/Double(numbers.count)
}

print(arithmaticMean(1,2,3,4,5,6,7))
print(arithmaticMean(1,2,3))


func swapTwoInteger (_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 107
print("num1:\(someInt) and num2:\(anotherInt)")

swapTwoInteger(&someInt, &anotherInt)

print("num1:\(someInt) and num2:\(anotherInt)")















