import UIKit

func getX(num1 a:Int, num2 b:Int) {
    
    func f1(t x:Int) -> Decimal {
        return pow(Decimal(a),x)
    }
    func f2(t x:Int) -> Decimal {
        return pow(Decimal(x),b)
    }
    
    var t = 0;
    for i in 3... {
        if f1(t:i) >= f2(t:i) {
            t = i
            break
        }
    
    }
    
    print(t)
}
getX(num1: 5, num2: 4)
