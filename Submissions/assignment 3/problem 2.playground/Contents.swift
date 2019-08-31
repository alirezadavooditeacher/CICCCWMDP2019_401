import UIKit


struct Point {
    var x:Int
    var y:Int
    mutating func reset () {
        self.x = 0
        self.y = 0
    }
    func printPoint(point: Point) {
        print("This is point is at [\(point.x),\(point.y)]")
    }
    static func average(points:[Point],of coord:Character) -> Int? {
        guard coord == "x" || coord == "y" else {
            return nil
        }
        
        var avg = 0
        for point in points {
            if coord == "x" {
                avg += point.x
            } else {
                avg += point.y
            }
        }
        
        return avg / points.count
    }
    static func vectorAverage(points: [Point]) -> Point? {
        guard !points.isEmpty else {
            return nil
        }
        
        guard let avgX = average(points: points, of: "x") else {
            return nil
        }
        guard let avgY = average(points: points, of: "y") else {
            return nil
        }
        
        return Point(x: avgX, y: avgY)
    }
}

let pointA = Point(x: 4, y: 6)
let pointB = Point(x: 3, y: 7)
let pointC = Point(x: 7, y: 2)
let pointD = Point(x: 3, y: 5)

if var avgPoint = Point.vectorAverage(points: [pointA, pointB, pointC, pointD]) {
    avgPoint.printPoint(point: avgPoint)
    avgPoint.reset()
    avgPoint.printPoint(point: avgPoint)
}
