//probem15
func calculator(oper op: String) -> ((Int,Int)->Double)? {
    var err = false
    func sum(num1 a: Int,num2 b: Int)-> Double{
        return Double(a+b)
    }
    func sub(num1 a: Int,num2 b: Int)-> Double{
        return Double(a-b)
    }
    func multiply(num1 a: Int,num2 b: Int)-> Double{
        return Double(a*b)
    }
    func divide(num1 a: Int,num2 b: Int)-> Double{
        if (b == 0){
            print("Zero can not be divided")
            return 0
        }
        else{
            return Double(a)/Double(b)
        }
        
    }
    
    switch op {
    case "+":
        return sum
    case "-":
        return sub
    case "*":
        return multiply
    case "/":
        return divide
    default:
        print("It's a wrong operator!")
        return nil
    }
}
if let f = calculator(oper: "+") {
    print("15+2 = \(f(15,2))")
}
if let f = calculator(oper: "-") {
    print("15-2 = \(f(15,2))")
}
if let f = calculator(oper: "*") {
    print("15*2 = \(f(15,2))")
}
if let f = calculator(oper: "/") {
    print("15/2 = \(f(15,2))")
}

