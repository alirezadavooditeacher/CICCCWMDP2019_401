//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String = ""
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("the width of someResolution is \(someResolution.width)")
print("the width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280

// test
// why can the consonant be changed?
// because of the property which is resolution is variable
// if you initialize resolution in VIdeoMode as consonant, this will complain
print("the width of someVideoMode is now \(someVideoMode.resolution.width)")


//Approach 1: Using simple default initializer

var myResolution = Resolution()

// they are gonna be complain if myResolution is consonant
myResolution.width = 800
myResolution.height = 1280

// approach 2 Using memberwise initializer
let yourResolution = Resolution(width: 800, height: 1280)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")

print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let remenberedDirection = currentDirection
currentDirection.turnNorth()

print("The currenvt direction is \(currentDirection)")
print("The remenberd direction is \(remenberedDirection)")

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsotenEighty = tenEighty
alsotenEighty.frameRate = 30.0


