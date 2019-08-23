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





