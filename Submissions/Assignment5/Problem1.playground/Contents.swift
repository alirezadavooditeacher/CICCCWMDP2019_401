import UIKit

class Shape {
    var area: Double {
        return 0
    }
    
    var circumference: Double {
        return 0
    }
}

class Rectangle:Shape {
    var height:Double = 0
    var width:Double = 0
    
    override var area: Double {
        return height * width
    }
    
    override var circumference: Double {
        return height * 2 + width * 2
    }
}

class Square:Shape {
    
    var height:Double = 0
    var width:Double = 0
    
    override var area: Double {
        return height * width
    }
    
    override var circumference: Double {
        return height * 2 + width * 2
    }
    
}

class Circle:Shape {
    var radius:Double = 0
    let pi = 3.14
    
    override var area: Double {
        return radius * radius * pi
    }
    
    override var circumference: Double {
        return ( radius + radius ) * pi
    }
}


let circle = Circle()
circle.radius = 5
print("Circle area is \(circle.area)")
print("Circle circumference is \(circle.circumference)")

let rectangle = Rectangle()
rectangle.height = 5
rectangle.width = 6
print("Rectangle area is \(rectangle.area)")
print("Rectangle circumference is \(rectangle.circumference)")

let square = Square()
square.height = 5
square.width = 5
print("Square area is \(square.area)")
print("Square circumference is \(square.circumference)")
