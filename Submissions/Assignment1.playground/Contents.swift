import UIKit


/*============================= problem 1 =============================*/
enum Math {
    case plus
    case minus
    case multiplication
    case division
}
func problem_1(a : CGFloat,b : CGFloat ,c : Math) -> CGFloat?{
    switch c {
    case .plus:
        return a + b
    case .minus:
        return a - b
    case .multiplication:
        return a * b
    case .division:
        if b==0 {
            return nil
        }else{
            return a / b
        }
    }
}
func problem_1(_ a : CGFloat,_ b : CGFloat ,_ c : Math) -> CGFloat?{
    switch c {
    case .plus:
        return a + b
    case .minus:
        return a - b
    case .multiplication:
        return a * b
    case .division:
        if b==0 {
            return nil
        }else{
            return a / b
        }
    }
}

//problem_1(10, 20, .plus)
//problem_1(a: 10, b: 20, c: .plus)


/*============================= problem 2 =============================*/
enum Shape {
    case shape1
    case shape2
    case shape3
}
func problem_2(_ input : Int ,_ shape : Shape){
    switch shape {
    case .shape1:
        guard input % 2 == 1 else {
            print("Error")
            return
        }
        for row in 1...input {
            for _ in 1...row{
                print(" ",terminator: "")
            }
            for _ in 2*row-1...input{
                print("*", terminator: "")
            }
            print("\n")
            if 2*row-1 >= input {
                break
            }
        }
    case .shape2:
        for row in 1...input {
            for _ in (row...input).reversed() {
                print("*", terminator: "")
            }
            print("\n")
        }
    case .shape3:
        for row in 1...input {
            for _ in 1...row {
                print("*", terminator: "")
            }
            print("\n")
        }
    }
}
//problem_2(10, .shape3)


/*============================= problem 3 =============================*/
func problem_3(a : Int) -> Int?{
    var temp : Int = 0
    guard  a>0 else {
        return nil
    }
    for i in 1...a {
        temp += i
    }
    return temp
}
//problem_3(a: 10)


/*============================= problem 4 =============================*/
func problem_4(a : Int,b : Int){
    if a <= b {
        subproblem_4_1(a: a, b: b)
        print("=================")
        subproblem_4_2(a: a, b: b)
        print("=================")
        subproblem_4_3(a: a, b: b)
    }else{
        subproblem_4_1(a: b, b: a)
        print("=================")
        subproblem_4_2(a: b, b: a)
        print("=================")
        subproblem_4_3(a: b, b: a)
    }
}
func subproblem_4_1(a : Int,b : Int){
    for i in a+1..<b{
        if i % 3 == 0 , i % 5 == 0 {
            print("\(i)")
        }
    }
}
func subproblem_4_2(a : Int,b : Int){
    for i in a..<b{
        if i % 6 == 0 || i % 7 == 0 {
            print("\(i)")
        }
    }
}
func subproblem_4_3(a : Int,b : Int){
    for i in a...b{
        if i % 3 != 0 {
            print("\(i)")
        }
    }
}
//problem_4(a: 6, b: 20)


/*============================= problem 5 =============================*/
func F1_x(A : Int, x : Int) -> Int{
    var temp = 1
    for _ in 1...x {
        temp *= A
    }
    return temp
}
func F2_x(x : Int, B : Int) -> Int{
    var temp = 1
    for _ in 1...B {
        temp *= x
    }
    return temp
}
func problem_5(A : CLong , B : CLong){
    var x = 3
    while x > 3{
        if F1_x(A: A, x: x) < F2_x(x: x, B: B) && F1_x(A, x: x + 1) > F2_x(x: x + 1, B: B){
            print("zzzz \(x)")
            break
        }
        x += 1
    }
}
//problem_5(A: 20, B: 30)


/*============================= problem 6 =============================*/
func problem_6(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var int1 : Int = 5
var int2 : Int = 8
//problem_6(&int1, &int2)


/*============================= problem 7 =============================*/
func reverseString(input : String) -> String?{
    var temp = ""
    for (_ , character) in input.enumerated() {
        temp = "\(character)" + temp
    }
    return temp
}

func problem_7(input : String?) -> Int?{
    guard let input = input else {
        return nil
    }
    if input == reverseString(input: input) {
        return 1
    }
    return 0
}
//problem_7(input: "BaBa")


/*============================= problem 8 =============================*/
func problem_8(numbers : Int...,number : Int){
    numbers.forEach { if $0 == number {
        print("exists")
        }
    }
}
//problem_8(numbers: 1,5,8, number: 8)


/*============================= problem 9 =============================*/
func problem_9(numbers : [Int],number : Int) -> [Int]{
    var newNumbers = [Int]()
    for i in numbers {
        if i != number {
            newNumbers.append(i)
        }
    }
    return newNumbers
}
//problem_9(numbers: [6,3,4,5] , number: 5)



