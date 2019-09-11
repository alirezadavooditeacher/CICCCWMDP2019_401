import Cocoa

var str = "Hello, playground"

struct Circle{
    var radius:Double = 0.0
    let PI = 3.14
    // every time we initialize computed property, we need to mention data type
    var area:Double{
        return radius * radius * PI
    }
}

var circle1 = Circle()
circle1.radius = 3.0
print(circle1.area)
