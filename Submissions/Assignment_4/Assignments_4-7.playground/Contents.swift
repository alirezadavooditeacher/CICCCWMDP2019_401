import UIKit

struct Circle{
    var radius = 0.0
    static let PI = 3.14
    var area:Double{
        get{
            return radius * radius * Circle.PI
        }
    }
}

var test = Circle()
var r = 2.0
test.radius = r
test.area
print("radius:\(r)\narea:\(test.area)\n")

r = 4
test.radius = r
test.area
print("radius:\(r)\narea:\(test.area)")
