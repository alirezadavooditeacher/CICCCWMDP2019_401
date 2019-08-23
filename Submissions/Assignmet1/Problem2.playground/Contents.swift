import UIKit

// Problem 2
func drawingShapes(inputNum:Int,formatOfShape:String){
    
    switch formatOfShape {
    case "shape1":
        shape1(inputNum)
    case "shape2":
        shape2(inputNum)
    case "shape3":
        shape3(inputNum)
    default:
        return
    }
}
func shape1(_ input: Int){
    var shape:String = ""
    for i in 0..<input {
        shape = ""
        for j in 0..<input {
            if j >= i && j <= (input - i - 1) {
                shape += "*"
            } else {
                shape += " "
            }
        }
        print(shape)
    }
}

func shape2(_ input: Int){
    for index in (0...5).reversed(){
        var shape: String = ""
        for _ in 0...index {
            shape += "*"
        }
        print(shape)
    }
}

func shape3(_ input: Int){
    var numberOfShape = "*"
    print(numberOfShape)
    for _ in 2...input {
        numberOfShape += "*"
        print(numberOfShape)
    }
}

let input = 5
let format = "shape3"
drawingShapes(inputNum: input, formatOfShape: format)
