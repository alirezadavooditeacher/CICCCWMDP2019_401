import UIKit

class Shape {
    var area: Int {
        return 0
    }
    var circumference: Double {
        return 0
    }
}

class Rectangle: Shape {
    var height: Int
    var width: Int
    override var area: Int {
        return height * width
    }
    init(height: Int, width: Int) {
        self.height = height
        self.width = width
    }
}

class Square: Shape {
    var side: Int
    override var area: Int {
        return side * side
    }
    init(side: Int) {
        self.side = side
    }
}

class Circle: Shape {
    let pi = 3.14
    var radius: Int
    override var circumference: Double {
        return pi * 2.0 * Double(radius)
    }
    init(radius: Int) {
        self.radius = radius
    }
}

var circle = Circle(radius: 4)
print(circle.circumference)

var rect = Rectangle(height: 4, width: 5)
print(rect.area)

var square = Square(side: 4)
print(square.area)
