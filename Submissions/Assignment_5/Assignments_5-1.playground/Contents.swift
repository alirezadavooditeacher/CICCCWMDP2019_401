import UIKit

class Shape{
    var Length = 0.0
    var width = 0.0
    var radious = 0.0
    var Area: String{
        return "Area is \(Length * width)"
    }
    var circumference: String{
        return "Circumference is \(2 * 3.14 * radious)"
    }
}

class Circle: Shape{
    override var Area: String{
        return "Circle area is \(radious * radious * 3.14)"
    }
    override var circumference: String{
        return "Circumference of circle is \(2 * 3.14 * radious)"
    }
}
class Rectangle: Shape{
    override var Area: String{
        return "Rectangle area is \(width * Length)"
    }
    override var circumference: String{
        return "Circumference of rectangle is \(2 * (width + Length))"
    }
}
class Square: Shape{
    override var Area: String{
        return "Square area is \(width * Length)"
    }
    override var circumference: String{
        return "Circumference of square is \(2 * (width + Length))"
    }
}

let test = Shape()
test.Length = 5
test.width = 3
test.radious = 2
print(test.circumference)
print(test.Area)

let circle = Circle()
circle.radious = 3
print(circle.circumference)
print(circle.Area)

let rectangle = Rectangle()
rectangle.Length = 2
rectangle.width = 3
print(rectangle.circumference)
print(rectangle.Area)

let square = Square()
square.Length = 5
square.width = 5
print(square.circumference)
print(square.Area)

