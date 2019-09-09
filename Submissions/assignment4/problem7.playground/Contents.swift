import UIKit

/* Problem7
 Define a struct called Circle with the following properties:
 1- Variable instance property called radius
 2- Constant Type property called PI (which is the PI number which is 3.14)
 3- Define a computed property called area.
 It represents the area of the circle.
 円の面積を表します。
 4- Write some examples to work with the Circle class.
 Circleクラスで動作するいくつかの例を作成します。
 */

struct Circle {
    var radius = 0.0
    static let pi = 3.14
    var area: Double {
        return radius * radius * Circle.pi
    }
}

var circle = Circle()
circle.radius = 12
print("Circle1: \(circle.area)")

circle.radius = 5
print("Circle2: \(circle.area)")

circle.radius = 31.4
print("Circle3: \(circle.area)")
