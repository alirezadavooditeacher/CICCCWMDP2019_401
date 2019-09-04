import UIKit
//problem2
struct point{
    var x = 0.0
    var y = 0.0
    mutating func reset(){
        x = 0.0
        y = 0.0
    }
    func printPoint(){
        print("point:\([x,y])")
    }
    static func average(char:Character,arr:[(Int,Int)])->Double?{
        var sum_x = 0
        var sum_y = 0
        var av_x = 0.0
        var av_y = 0.0
        switch char {
        case "x":
            for i in 0..<arr.count{
                sum_x += arr[i].0
            }
            av_x = Double(sum_x)/Double(arr.count)
            return av_x
        case "y":
            for i in 0..<arr.count{
                sum_y += arr[i].1
            }
            av_y = Double(sum_y)/Double(arr.count)
            return av_y
        default:
            return nil
        }
    }
    static func vectorAverage(arr:[(Int,Int)])->(Double,Double){
        let r_x = average(char: "x", arr:arr)!
        let r_y = average(char: "y", arr:arr)!
        return (r_x,r_y)
    }
    
    
}
var test1 = point(x: 5, y: 2)
test1.printPoint()
test1.reset()
print("reset")
test1.printPoint()

if let t1 = point.average(char: "x", arr: [(2,5),(3,6)]){
    print("average x = \(t1)")
}
if let t2 = point.average(char: "y", arr: [(2,5),(3,6)]){
    print("average y = \(t2)")
}

let (a,b) = point.vectorAverage(arr: [(2,5),(3,6)])
let test2 = point.init(x: a, y: b)
test2.printPoint()
