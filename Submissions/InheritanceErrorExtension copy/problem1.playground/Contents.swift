import Cocoa

var str = "Hello, playground"

class shape {
    var area: Double{
        return 0.0
    }
    
    static var circumference:Double = 0.0
}

class Ractangle: shape {
    var height:Double = 0.0
    var width:Double = 0.0
    
    override var area: Double{
        return height * width
    }
}
class Square: shape {
    var length = 0.0
    override var area: Double{
        return length * length
    }
}
class Circle: shape {
    var radius = 0.0
    var PI = 3.14
    override var area: Double{
        return radius * radius * PI
    }
}

let ractangle = Ractangle()
ractangle.height = 15.0
ractangle.width = 5.0
print("ractangle area : \(ractangle.area)")

let square = Square()
square.length = 15.0
print("square area : \(square.area)")

let circle = Circle()
circle.radius = 15.0
print("circle area : \(circle.area)")



