//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct point{
    var x:Double
    var y:Double
    
    mutating func reset() {
        x = 0
        y = 0
    }
    
    mutating func printPoint(x:Int, y:Int) {
        print(x, y)
    }
    
    static func average(arrPoint:[Double], arrCharactor:Character) -> Double? {
        
        var sum:Double = 0
        var result:Double? = 0
       
        if arrPoint.isEmpty {
           return nil
        } else {
            for value in arrPoint {
                sum += value
                result = sum / Double(arrPoint.count)
            }
             return result
        }
    }
    
    
    static func vectorAverage(arrPoint:[Int]) -> (Double,Double)?{
        let x = average(arrPoint: [1,6,9,10,21,34], arrCharactor: "x")
        let y = average(arrPoint: [1,3,4,7,10,15], arrCharactor: "y")
        
        if let xAverage = x, let yAverage = y  {
            return (xAverage, yAverage)
        } else {
            print("put the array")
        }
       return nil
    }
    
    
}

var x1 = 10.0
var y1 = 10.0
point(x: x1, y: y1).printPoint(x: x1, y: y1)
