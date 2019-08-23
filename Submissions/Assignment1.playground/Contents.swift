import UIKit

// Problem 1

func calculator(operators opt: Character, input1 number1: Int, input2 number2: Int){
    
    print("\n---- Problem 1 ----")
    
    switch opt {
    case "+":
        print(number1 + number2)
    case "-":
        print(number1 - number2)
    case "*":
        print(number1 * number2)
    case "/":
        switch number2 {
        case 0:
            print ("Don't be stupid!")
        default:
            print(number1 / number2)
        }
    default:
        fatalError("Unsupported")
    }
}

calculator(operators: "/", input1: 30, input2: 0)

// Problem 2

func problem2(input number: Int){
    print("\n---- Problem 2 ----")
    for i in 1...number {
        let s = String(repeating: "*", count: i)
        print(s)
    }
}

problem2(input: 5)

// Problem 3

func sum(input1 number1: Int, input2 number2: Int) -> Int?{
    print("\n---- Problem 3 ----")
    if number1 < 0 {
        return nil
    }else if number2 < 0 {
        return nil
    }
return(number1 + number2)
}
let ans: Int? = sum(input1: 2, input2: 6)
print("\(String(describing: ans))")

// Problem 4

func problem4(inputA numberA: Int, inputB numberB: Int){
    print("\n---- Problem 4 ----")
    func divisible3and5(){
        var arrayAns1: [Int] = []
        for j in (numberA+1)..<numberB{
            if (j % 3 == 0) && (j % 5 == 0){
                arrayAns1.append(j)
            }
        }
        print("numbers between A and B (A and B not included), which are divisible to both 3 and 5 :")
        for answer in arrayAns1{
            print("\(answer), ", terminator: "")
        }
    }
    
    func divisible6or7(){
        var arrayAns2: [Int] = []
        for k in numberA..<numberB{
            if (k % 6 == 0) || (k % 7 == 0){
                arrayAns2.append(k)
            }
        }
        print("\nnumbers between A and B (A included but B not included), which are divisible by either 6 or 7 :")
        for answer in arrayAns2{
            print("\(answer), ", terminator: "")
        }
    }
    
    func notDivisible3(){
        var arrayAns3: [Int] = []
        for l in numberA...numberB{
            if (l % 3 != 0){
                arrayAns3.append(l)
            }
        }
        print("\nnumbers between A and B (A and B both included), which are not divisible by 3 :")
        for answer in arrayAns3{
            print("\(answer), ", terminator: "")
        }
    }
    
    divisible3and5()
    divisible6or7()
    notDivisible3()
}

problem4(inputA: 3, inputB: 40)

// Problem 6

func problem6(swap1: inout Int, swap2: inout Int){
    print("\n\n---- Problem 6 ----")
    print("The first integer is \(swap1), the second integer is \(swap2)")
    let temporary = swap1
    swap1 = swap2
    swap2 = temporary
    print("After swap, the first integer is \(swap1), the second integer is \(swap2)")
}

var swapNum1 = 12
var swapNum2 = 100
problem6(swap1: &swapNum1, swap2: &swapNum2)

// Problem 7

func problem7(input7: String) -> Int? {
    print("\n---- Problem 7 ----")
    let newString7 = String(input7.reversed())
    if input7.isEmpty{
        return nil
    } else {
        if input7 == newString7{
            return 1
        } else {
            return 0
        }
    }
}
let answer7 = problem7(input7: "Bab")
print(answer7)

// Problem 8

func problem8(inputArray8 inputArray8: [Int], checkNumber checkNumber: Int){
    print("\n---- Problem 8 ----")
    if inputArray8.contains(checkNumber){
        print("\(checkNumber) belongs to the list of integer.")
    } else {
        print("\(checkNumber) does not belong to the list of integer.")
    }
}

problem8(inputArray8: [2, 3, 4, 5, 6, 7, 8,-3, 103], checkNumber: -3)

// Problem 9

func problem9(inputArray9 inputArray9: [Int], removedNumber removedNumber: Int){
    print("\n---- Problem 9 ----")
    let newArray9 = inputArray9.filter{$0 != removedNumber}
    for answer9 in newArray9{
        print("\(answer9), ", terminator: "")
    }
}

problem9(inputArray9: [2, 3, 3, 5, 6, 3, 8,-3, 103], removedNumber: 3)

// Problem 10

func problem10(name: String, grade1: Int, grade2: Int, grade3: Int, grade4: Int, grade5: Int){
    print("\n\n---- Problem 10 ----")
    let averageGrade = ((grade1 + grade2 + grade3 + grade4 + grade5) / 5)
    print("\(name), average grade is \(averageGrade).")
}

problem10(name: "Ali", grade1: 67, grade2: 87, grade3: 90, grade4: 45, grade5: 39)

// Problem 12

func problem12(inputArray12 inputArray12: [Int]){
    print("\n---- Problem 12 ----")
    var newArray12 = inputArray12
    for m in 0..<(inputArray12.count - 1){
        if inputArray12[m] == inputArray12[(m+1)]{
            newArray12 = inputArray12.filter{$0 != inputArray12[m]}
        }
    }
    print("The list of distinct numbers : ", terminator: "")
    for answer12 in newArray12{
        print("\(answer12), ", terminator: "")
    }
}

problem12(inputArray12: [2, 3, 3, 5, 6, 3, 8,-3, 103])

// Problem 15

func calculator(_ opt: Character) -> ((Int, Int) -> Double)?{
    func sum(_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 + num2)
    }
    
    func sub(_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 - num2)
    }
    
    func multiplu(_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 * num2)
    }
    
    func devision(_ num1: Int, _ num2: Int) -> Double {
        return Double(Double(num1) / Double(num2))
    }
    
    func remainder(_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 % num2)
    }
    
    switch opt {
    case "+":
        return sum
    case "-":
        return sub
    case "*":
        return multiplu
    case "/":
        return devision
    case "%":
        return remainder
    default:
        return nil
    }
}
print("\n\n---- Problem 15 ----")

let num1 = 15
let num2 = 4


if let f = calculator("+"){
    print("\(num1) + \(num2) = \(f(num1, num2))")
}

if let f = calculator("-"){
    print("\(num1) - \(num2) = \(f(num1, num2))")
}

if let f = calculator("*"){
    print("\(num1) * \(num2) = \(f(num1, num2))")
}

if let f = calculator("/"){
    print("\(num1) / \(num2) = \(f(num1, num2))")
}
if let f = calculator("%"){
    print("\(num1) % \(num2) = \(f(num1, num2))")
}
