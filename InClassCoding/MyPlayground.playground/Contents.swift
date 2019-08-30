//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// iterating over enumeration cases

//enum Feverage: CaseIterable {
//    case coffee, tea, juice
//}


enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFG")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    
case .qrCode(let productCode):
    print("QR code: \(productCode)")

}

//how to use enum and row value will be in the quiz

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint: String {
    case north, south, east, west
}

let earthsOrder = Planet.earth.rawValue
print(earthsOrder)
let sunsetDirection = CompassPoint.west.rawValue
print(sunsetDirection)

//possiblePlanet is of type Planet? and equals Planet.uranus”
let possiblePlanet = Planet(rawValue: 7)

let positionToFind = 11

//optional binding
if let somePlanet = Planet(rawValue: positionToFind){
    switch somePlanet {
    case .earth:
        print("Mostly Harmless")
    default:
        print("Not a sage place for humans")
    }
} else {
    print("there isn't  a planet at position \(positionToFind)")
}


//







