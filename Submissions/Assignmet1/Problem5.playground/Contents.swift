import UIKit

// Problem 5
func caculateX(A aNum:Int,B bNum:Int) -> Int{
    
    func aFanc(t x:Int)->Decimal{
        return pow(Decimal(aNum), x)
    }
    
    func bFanc(t x:Int)->(Decimal){
        return pow(Decimal(x),bNum)
    }
    
    var t = 0
    for i in 3... {
        if aFanc(t: i) >= bFanc(t: i){
            t = i
            break
        }
    }
    
    return t
}
caculateX(A: 4, B: 5)

