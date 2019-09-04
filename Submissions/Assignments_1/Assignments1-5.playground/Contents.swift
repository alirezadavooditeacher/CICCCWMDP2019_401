import UIKit

//problem5
func math_A(_ A:Double,_ x:Double) -> Double{
    let a: Double = pow(A, x)
    return a
}
func math_B(_ B:Double,_ x:Double) -> Double{
    return pow(x,B)
}

func math(A:Double,B:Double){
    var xnum:Double = 2
    var FA: Double
    var FB: Double
    repeat{
        xnum += 1
        FA = math_A(A,xnum)
        FB = math_B(B,xnum)
    }while(FA < FB)
    print("A=\(A), B =\(B), x = \(xnum)")
}

math(A:2,B:5)
