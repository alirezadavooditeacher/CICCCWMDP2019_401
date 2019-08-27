import UIKit

func calculator(num1:Int,num2:Int,operation:String)->(Double,(Int,Int)->Double){
    var listOfAnswer = [String:(Int,Int)->Double]()
    var result: Double = 0
    
    func sum(num1: Int,num2:Int)->Double{
        return Double(num1 + num2)
    }

    func division(num1: Int,num2:Int)->Double{
        return Double(num1 / num2)
    }
    
    func diference(num1: Int,num2:Int)->Double{
        return Double(num1 - num2)
    }
    
    func power(num1: Int,num2:Int)->Double{
        return pow(Double(num1), Double(num2))
    }
    
    func multiplication(num1: Int,num2:Int)->Double{
        return Double(num1 * num2)
    }
    
    listOfAnswer = [
        "sum":sum,
        "division":division,
        "diference":diference,
        "power":power,
        "multiplication":multiplication
    ]
    
    if let fuc = listOfAnswer[operation] {
        result = fuc(num1,num2)
    }
    return (result,listOfAnswer[operation]!)
}
let listOfOperaters = ["sum","division","diference","power","multiplication"]

for operater in listOfOperaters {
    let num1 = Int.random(in: 1...10)
    let num2 = Int.random(in: 0...10)
    let (result,dic) = calculator(num1: num1, num2: num2, operation: operater)
    print("\(num1) \(operater) \(num2) = \(result)")
    print("\(result),\(String(describing: dic))")
}
