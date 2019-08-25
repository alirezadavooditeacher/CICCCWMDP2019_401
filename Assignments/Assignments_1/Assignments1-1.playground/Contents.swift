
//problem1
func calculator(oper op: String, num1 a:Double ,num2 b:Double) -> Double? {
    switch op {
        case "+":
            return a+b
        case "-":
            return a-b
        case "*":
            return a*b
        case "/":
            if b == 0{
                return nil
            }
            else{
                return a/b
                
            }
        default:
            print("It's a wrong operator!")
            return nil
    }
}



//problem1 without argument
func calculator2(_ op: String,_ a:Double ,_ b:Double) -> Double? {
    switch op {
    case "+":
        return a+b
    case "-":
        return a-b
    case "*":
        return a*b
    case "/":
        if b == 0{
            return nil
        }
        else{
            return a/b
            
        }
    default:
        print("It's a wrong operator!")
        return nil
    }
}
if let ans = calculator(oper:"/",num1: 12,num2: 5){
    print(ans)
}
if let ans = calculator2("/",12,5) {
    print(ans)
}





