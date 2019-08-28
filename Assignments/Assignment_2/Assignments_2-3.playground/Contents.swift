import UIKit

var dic = [String:(Int,Int)->Double]()

func calculator(a:Int,b:Int,op:String)->(ans:Double,((Int,Int)->Double)?){
    
    func Sum(a:Int,b:Int)->Double{
        let ans = Double(a+b)
        print("\(a)+\(b)=\(ans)")
        return ans
    }
    
    func Division(a:Int,b:Int)->Double{
        let ans = Double(a)/Double(b)
        print("\(a)/\(b)=\(ans)")
        return ans
    }
    
    func Difference(a:Int, b:Int)->Double{
        var ans = Double(a - b)
        if(ans<0){ans = -ans}
        print("|\(a)-\(b)|=\(ans)")
        return ans
    }
    
    func Power(a:Int,b:Int)->Double{
        let ans = pow(Double(a), Double(b))
        print("\(a)^\(b)=\(ans)")
        return ans
    }
    
    func Multiplication(a:Int,b:Int)->Double{
        let ans = Double(a*b)
        print("\(a)*\(b)=\(ans)")
        return ans
    }

    switch (op){
    case "sum": dic["sum"] = Sum
        if let dicType = dic["sum"]{
            return (Sum(a:a, b:b),dicType)
        }
    case "division": dic["division"] = Division
    if let dicType = dic["division"]{
        return (Division(a:a, b:b),dicType)
        }
    case "difference": dic["difference"] = Difference
    if let dicType = dic["difference"]{
        return (Difference(a:a, b:b),dicType)
        }
    case "power": dic["power"] = Power
    if let dicType = dic["power"]{
        return (Power(a:a, b:b),dicType)
        }
    case "multiplication": dic["multiplication"] = Multiplication
    if let dicType = dic["multiplication"]{
        return (Multiplication(a:a, b:b),dicType)
        }
    default: print("Wrong operation")
        return (0.0,nil)
    }
    return (0.0,nil)
}
let array = ["sum","division","difference","power","multiplication"]
for value in array{
    calculator(a:2,b:3,op:value)
}

