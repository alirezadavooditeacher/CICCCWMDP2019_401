import UIKit

struct Circle {
    var radius:Double = 0
    static let pi = 3.14
    var area:Double {
        return radius * radius * Circle.pi
    }
}

var circle = Circle(radius: 5)
print("Area is \(circle.area)")
