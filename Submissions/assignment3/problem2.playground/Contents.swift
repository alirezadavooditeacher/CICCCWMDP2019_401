import UIKit

/* Problem2
 - Let’s do some math:
 o Define a structure called point
 o Point has two integer variables called: x and y
 o Create a method called reset which set the x and y to 0
 o Define an instance method called printPoint, which takes a point and print its
 coordination in this format: the point is at coordinate [x,y] where x and y are the x
 and y coordination of the input point.
 oポイントを取得し、この形式で調整を印刷するprintPointというインスタンスメソッドを定義します。ポイントは座標[x、y]にあります。xとyは入力ポイントのxとyの調整です。
 
 o Define a static method called average which takes an array of points as well as a
 character. (so the method has 2 inputs). If the input charcter is ‘x’ then the function calculates the average of x coordination of all points in the array and returns it.
 oSimilarly if the input character is ‘y’ then it calculates the average of y coordination of the input points. If the character is not ‘x’ or ‘y’ then the function returns nil.
 o Define another static method called vectorAverage which takes an array of points. The method then calculates the average x and average y using the average function you defined above and create another point whose x is equal to average x and y is equal to average y and returns the resulting point.
 o ポイントの配列をとるvectorAverageという別の静的メソッドを定義します。
 メソッドは、上で定義した平均関数を使用して平均xと平均yを計算し、xが平均xに等しく、yが平均yに等しい別のポイントを作成し、結果のポイントを返します。
 
 o Then use the printPoint method to print the resulting point from previous question
 (average point).
 
 */

struct Point {
    var x: Int
    var y: Int
    
    mutating func reset() {
        self.x = 0
        self.y = 0
    }
    
    // 非static だと vevtorAverage から値を受け取れない????
    func printPoint (_ point: (Int, Int)) {
        print("x:\(point.0) y:\(point.1)")
    }
    
    static func average (_ points: (Character, [Int])) -> Int? {
        var sumOfPoints = 0
        var ave = 0
        if points.0 == "x" || points.0 == "y" {
            for point in points.1 {
                sumOfPoints += point
            }
            ave = sumOfPoints / points.1.count
            return ave
        } else {
            return nil
        }
    }
    
    static func vectorAverage (_ points: ([Int], [Int])) -> (Int, Int)? {
        if let x = average(("x", points.0)), let y = average(("y", points.1)) {
            return (x, y)
        } else {
            return nil
        }
    }
    
    
}

if let ans = Point.vectorAverage(([19,7,21,3,42,5],[35,22,13,6,57,])) {
    let point = Point(x: 0, y: 0)
    point.printPoint(ans)
}
