import UIKit

// Problem 2
struct Point {
    
    var x,y:Int
    
    mutating func reset() {
        x = 0
        y = 0
    }
    
    func printPoint(priPoint:Point){
        print("the point is at coordinate [x,y] where x and y are the \(x) and \(y) coordination of the input point.")
    }
    
    static func average(points:[Point], coordinate:String) -> Int?{
        
        guard coordinate == "x" || coordinate == "y" else {
            return nil
        }
        
        var totalSum = 0
        for point in points {
            
            if coordinate == "x" {
                totalSum += point.x
            } else {
                totalSum += point.y
            }
        }
        
        return totalSum / points.count
    }
    
    static func vectorAverage(points:[Point])->Point?{
        
        guard let averageX = average(points: points, coordinate:"x") else {
            return nil
        }
        
        guard let averageY = average(points: points, coordinate: "y") else {
            return nil
        }
        
        return Point(x: averageX, y: averageY)
    }
}


let coordinate1 = Point(x: 6, y: 9)
let coordinate2 = Point(x: 2, y: 4)
let coordinate3 = Point(x: 1, y: 9)
let coordinate4 = Point(x: 6, y: 6)

if var answer = Point.vectorAverage(points: [coordinate1,coordinate2,coordinate3,coordinate4]) {
    answer.printPoint(priPoint:answer)
}


