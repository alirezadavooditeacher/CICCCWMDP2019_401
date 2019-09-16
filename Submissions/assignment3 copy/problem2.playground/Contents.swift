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
    
    static func average(arrPoint:[point], arrCharactor:Character) -> Double? {
        
        var sum:Double = 0
        var result:Double? = 0
       
        if arrPoint.isEmpty {
           return nil
        } else {
            for value in arrPoint {
                sum += arrCharactor == "x" ? value.x : value.y
                
                // the code is same as the code above
//                if arrCharactor == "x" {
//                    sum += value.x
//                } else if arrCharactor == "y" {
//                    sum += value.y
//                }
                
                result = sum / Double(arrPoint.count)
            }
             return result
        }
    }
    
    
    
    static func vectorAverage(arrPoints:[point]) -> (Double,Double)?{
        let x = average(arrPoint: arrPoints, arrCharactor: "x")
        let y = average(arrPoint: arrPoints, arrCharactor: "y")
        
        if let xAverage = x, let yAverage = y  {
            return (xAverage, yAverage)
        } else {
            print("put the array")
        }
       return nil
    }
    
    
}

// initialize each x and y value
// and then stored each point structs in the array

var mainArr:[point] = [point(x: 1, y: 5),point(x: 14, y: 8), point(x: 2, y: 3) ]

//point(x: x1, y: y1).printPoint(x: x1, y: y1)
print(point.vectorAverage(arrPoints: mainArr)!)
