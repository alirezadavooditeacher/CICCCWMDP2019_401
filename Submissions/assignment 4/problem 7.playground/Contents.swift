import UIKit

struct Circle {
    var radius = 0.0
    static let pi = 3.14
    var area:Double {
        return Circle.pi * radius * radius
    }
}

var circle1 = Circle()
circle1.radius = 2
print(circle1.area)

var circle2 = Circle()
circle2.radius = 1.2
print(circle2.area)
