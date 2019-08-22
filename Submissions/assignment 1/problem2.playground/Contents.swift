import UIKit

func draw(_ num:Int, _ shape:String) {
    
    var stringLine = "";
    switch shape.lowercased() {
    case "shape1":
        for i in 0..<num {
            stringLine = ""
            for j in 0..<num {
                if j >= i && j <= (num - i - 1) {
                    stringLine += "*"
                } else {
                    stringLine += " "
                }
            }
            print(stringLine)
        }
    case "shape2":
        for i in (0..<num).reversed() {
            stringLine = ""
            for j in 0..<num {
                if i >= j {
                    stringLine += "*"
                } else {
                    stringLine += " "
                }
            }
            print(stringLine)
        }
    case "shape3":
        for i in 0..<num {
            stringLine = ""
            for j in 0..<num {
                if i >= j {
                    stringLine += "*"
                } else {
                    stringLine += " "
                }
            }
            print(stringLine)
        }
    default:
        print("Invalid shape")
    }
    
}
draw(7, "SHAPE3")
