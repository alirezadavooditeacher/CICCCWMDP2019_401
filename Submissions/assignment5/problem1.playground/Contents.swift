import UIKit

/* Problem 1: Shape and Inherited Computed Properties
 
 Design a class called Shape which is the parent of the classes Rectangle, Square and Circle. Also define classes for Rectangle, Square and Circle to be child of the class Shape.
 The class shape has area and circumference.
 • Define area and circumference to be computed properties of the class Shape.
 
 • Use override to override the computed properties of the classes Rectangle, Square and
 Circle.
 • Provide some example to show your implementation works.

 クラスRectangle、Square、Circleの親であるShapeというクラスを設計します。 また、Rectangle、Square、CircleのクラスをShapeクラスの子として定義します。
     クラスShapeには面積と円周があります。
     •クラスShapeの計算されるプロパティである面積と円周を定義します。
   
     •クラスRectangle、Square、Circleの計算されたプロパティをオーバーライドするには、オーバーライドを使用します。
     •実装の動作を示すための例を提供します。
 
*/

class Shape {
    var area: Double {
        return 0
    }          // 面積
    var circumference: Double {
        return 0
    }   // 周囲
}

// 長方形
class Rectangle: Shape {
    var height = 0.0
    var width = 0.0
    
    func receiveNum(_ height: Double, _ width: Double) {
        self.height = height
        self.width = width
    }
    
    override var area: Double {
        return height * width
    }
    
    override var circumference: Double {
        return (height + height) * 2
    }
    
}

// 正方形
class Square: Shape {
    var oneSide = 0.0
    
    func receiveNum(_ oneSide: Double) {
        self.oneSide = oneSide
    }
    
    override var area: Double {
        return oneSide * oneSide
    }
    
    override var circumference: Double {
        return oneSide * 4
    }
}

// 円形
class Circle: Shape {
    var radius = 0.0
    
    func receiveNum(_ radius: Double) {
        self.radius = radius
    }
    
    override var area: Double {
        return radius * radius * 3.14
    }
    
    override var circumference: Double {
        return (radius * 2) * 3.14
    }
}


let rectangle1 = Rectangle()
rectangle1.receiveNum(4, 8)
print("rectangle1\narea: \(rectangle1.area)  circumference: \(rectangle1.circumference)\n")

let square1 = Square()
square1.receiveNum(5)
print("square1\narea: \(square1.area)  circumference: \(square1.circumference)\n")

let circle1 = Circle()
circle1.receiveNum(3)
print("circle1\narea: \(circle1.area)  circumference: \(circle1.circumference)\n")
