/** PROBLEM 1
 - Design for a function which takes 2 operands (number) and one operator (plus, minus, multiplication and division) and applies the operator on the operands and print and return the result.
 Note: If operand1 is a non-zero number and the operand2 is zero, then the program should not perform the division operand and should print the operation is not possible because one number if zero (this is only for division operator) and return nil.
 - Use both argument label and parameter name for this function.
 - Re-write the same function without using an argument label for the input parameters.
 */
print("\n---- Problem 1 ----")
func calculator(math opt: Character, first number1: Int, second number2: Int){
    
    switch opt {
    case "+":
        print("The Sum is \(number1 + number2)!")
    case "-":
        print("The subtraction is \(number1 - number2)!")
    case "*":
        print("The multiplication is \(number1 * number2)!")
    case "/":
        if number2 == 0{
          print ("It is not possible divide by zero in Math!")
        }else{
        print("The division is \(number1 / number2)!")
        }
    default:
        fatalError("There is something wrong!")
    }
}

calculator(math: "/", first: 10, second:01)

/* PROBLEM 2
 Design a function for an application which receive a number and a shape format (which is a string either “SHAPE1” or “SHAPE2” or “SHAPE3”) and prints a shape like this: (if the input is 5)
 
 - Example: input: 5 format: SHAPE1
 *****
 ***
 *
 
 - Example: input: 5 format: SHAPE2
 *****
 ****
 ***
 **
 *
 
 Example: input: 5 format: SHAPE3
 *
 **
 ***
 ****
 *****
 
 - For the function above do not use any argument label (use the _ symbol to call the function)
 - Notice that this function has no return type.
 
 */

print("\n---- Problem 2 ----")
func draw( Shape sh: String, number n: Int){
    
    switch sh {
    case "SHAPE1":
        print("I didn't undersdant the first pattern")
        
    case "SHAPE2":
        print("SHAPE2")
        for i in 1...n {
            let s = String(repeating: "*", count: i)
            print(s)
        }
        
    case "SHAPE3":
        print("SHAPE3")
        for i in n...1 {
            let s = String(repeating: "*", count: i)
            print(s)
        }
    default:
            fatalError("problem")
    }
    
}
    draw(Shape :"SHAPE2", number: 10)

/* PROBLEM 3
Design a function which receives a number as input parameter and adds the number together and returns the results. If the number is negative the function will return nil instead.
 */
print("\n---- Problem 3 ----")
func receiver(number n: Double){
    if n < 0{
        print("nil")
    }
}

/* PROBLEM 4
 Write a function which receives two number A and B as its parameters:
 First prints all numbers between A and B (A and B not included), which are divisible to both 3 and 5.
 Then prints all numbers between A and B (A included by B not included), which are divisible by either 6 or 7.
 Finally prints all numbers between A and B (A and B both included), which are not divisible by 3.
 Hint: Design a function for each sub problem and then call them inside another function.
 */
print("\n---- Problem 4 ----")

func calc(num1:Int, num2:Int) {
    func check(_ num1:Int, _ num2:Int) { for value in (num1 + 1)..<num2 {
        if value % 3 == 0 && value % 5 == 0 {
            print(value)
        } }
    }
    func firstCheck(_ num1:Int, _ num2:Int) { for value in num1..<num2 {
        if value % 6 == 0 || value % 7 == 0 {
            print(value)
        } }
    }
    func checkAll(_ num1:Int, _ num2:Int) { for value in num1...num2 {
        if value % 3 != 0 {
            print(value)
        } }
    }
    check(num1, num2); firstCheck(num1, num2); checkAll(num1, num2)
}
calc(num1:8, num2:20)

/* PROBLEM 5
 Write a function which receives 2 number A and B as input parameter. Then using A and B, the function considers calculating two mathematical functions:
 • F1(x) = A^x
 • F2(x) = x^B
 The program should find the positive number (and greater than 2), (let’s call is T) which has the following characteristic:
 • For all numbers which are less than T we have F1(x)< F2(x)
 • For all numbers which are greater than or equal T we have F1(x)> F2(x)
 - Hint: Define two functions one for calculating F1(x) and one for calculating F2(x). The  function returns the result based on given A, B and x. Use both argument label and parameter name for the input parameters in the functions in this problem.
 
 */
print("\n---- Problem 5 ----")
import UIKit
func mathematicalFunctions(num1 a:Int, num2 b:Int) {
    func function1(t x:Int) -> Decimal { return pow(Decimal(a),x)
    }
    func function2(t x:Int) -> Decimal {
        return pow(Decimal(x),b) }
    var t = 0;
    for i in 3... {
        if function1(t:i) >= function2(t:i) { t=i
            break
        } }
    print(t) }
mathematicalFunctions(num1: 10, num2: 8)

/* PROBLEM 6
 */
print("\n---- Problem 6 ----")

func swap(_ num1:inout Int, _ num2:inout Int) { let aux = num1
    num1 = num2
    num2 = aux }
var num1 = 4
var num2 = 9
swap(&num1,&num2); print(num1, num2)

/* PROBLEM 7 */
 print("\n---- Problem 7 ----")
 import UIKit
 func compareString(_ string:String) -> (Int, String?)? {
 guard !string.isEmpty else { return nil
 }
 var string1 = "";
 var result:(Int, String?)
 for letter in string.reversed() { string1.append(letter)
 }
 if string1.contains(string) { result = (1, nil)
 } else {
 result = (0, "The Reversed string is different from the first one")
 }
 return result }
 if let (status, message) = compareString("BaBa") { if status == 1 {
 print("The string is the same as the original, even reversed") } else if let mess = message {
 print(mess) }
 } else {
 print("Empty string")
 }

/* PROBLEM 8
 */
print("\n---- Problem 8 ----")
func problem8(_ num:Int, in list:Int...) {
    let numberList = Set<Int>(list); if numberList.contains(num) {
        print("The number \(num) inside the list") } else {
        print("The number \(num) is not inside the list") }
}
problem8(6, in: 1,4,8,9,3,5)

/* PROBLEM 9
 */
print("\n---- Problem 9 ----")
func twoInputs(list:[Int]) -> (Int, Int)? {
    
    guard !list.isEmpty else {
        return nil
    }
    var Occurences = [Int: Int]()
    var aux = 1
    var num = list[0]
    
    for value in list {
        if var Value = Occurences[value] {
            Value = Value + 1
            Occurences[value] = Value
            let Index = list.firstIndex(of: value)!
            let previousIndex = list.firstIndex(of: num)!
            if Value >= aux && Index <= previousIndex {
                aux = Value
                num = value
            }} else {
            Occurences[value] = 1
        }}
    return (num, aux)
}
let result = twoInputs(list: [1,2,3,4,5,6,7,8,9,10])
print(result)

/* PROBLEM 10
 */
print("\n---- Problem 10 ----")
func finder(students:[(String, Int, Int, Int, Int, Int)]) -> (String, Int)? {
    
    guard !students.isEmpty else {
        print("Empty")
        return nil
    }
    
    var bestStudent = ("", 0)
    var gpa = 0;
    for student in students {
        gpa = student.1 + student.2 + student.3 + student.4 + student.5
        gpa = gpa/5
        if gpa > bestStudent.1 {
            bestStudent = (student.0, gpa)
        }
    }
    return bestStudent
}
let students = [("Steve", 10, 20, 30, 40 , 50), ("Ali", 80, 90, 100, 10, 20), ("Derrick", 30, 40, 50, 60, 70),]
if let (name, gpa) = finder(students: students) {
    print("The student \(name) and his GPA: \(gpa) is the Best")
}

/* PROBLEM 11
 */
print("\n---- Problem 11 ----")
func problem11(nums: [Int]) -> [Int:Int] {
    var list = [Int:Int]()
    
    for number in nums {
        list[number] = (list[number] ?? 0) + 1
    }
    
    print(list)
    return list
}

problem11(nums: [10, 10, 20, 30, 40, 40, 50])


/* PROBLEM 12
 */
print("\n---- Problem 12 ----")
func problem12(nums: inout [Int]) -> [Int] {
    var num = 0
    for i in nums {
        if i == num {
            let toBeRemoved = nums.firstIndex(of: i)
            let repeated = nums.firstIndex(of: num)
            nums.remove(at: toBeRemoved!); nums.remove(at: repeated!)
        } else {
            num = i
        }
    }
    print(nums)
    return nums
}

var array = [1, 2, 2, 3, 3, 5]

problem12(nums: &array)


/* PROBLEM 13
 */
print("\n ---- Problem 13 ----")
func problem13(words: [String]) -> [Character:[String]] {
    var list = [Character:[String]]()
    for word in words {
        if let aux = word.first {
            if list[aux] != nil {
                var new = list[aux]!
                new.append(word)
                list[aux]! = new.sorted()
            } else {
                list[aux] = [word]
            }
        }
    }
    list.keys.sorted(by: <)
    print(list)
    return list
}

problem13(words: ["Jet", "Airplane", "Hellicopter", "ship"])

/* PROBLEM 14
 */
print("\n ---- Problem 14 ----")

func problem14(sort: (String,String) -> Bool, strings: [String]) {
    strings.sorted(by: sort)
}

func fromAtoZ(aux1: String, aux2: String) -> Bool {
    if aux1 < aux2 {
        return true
    } else {
        return false
    }
}

func fromZtoZ(aux1: String, aux2: String) -> Bool {
    if aux1 > aux2 {
        return true
    } else {
        return false
    }
}

problem14(sort: fromAtoZ(aux1:aux2:), strings: ["House", "Home", "Car"])
problem14(sort: fromZtoZ(aux1:aux2:), strings: ["Ariana", "Zed", "James"])

/* PROBLEM 15
 */
print("\n ---- Problem 15 ----")
func problem15(_ opt: Character) -> ((Int, Int) -> Double)?{
    func sum(_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 + num2)
    }
    
    func sub(_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 - num2)
    }
    
    func multip(_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 * num2)
    }
    
    func div(_ num1: Int, _ num2: Int) -> Double {
        return Double(Double(num1) / Double(num2))
    }
    
    func fun(_ num1: Int, _ num2: Int) -> Double {
        return Double(num1 % num2)
    }
    
    switch opt {
    case "+":
        return sum
    case "-":
        return sub
    case "*":
        return multip
    case "/":
        return div
    case "%":
        return fun
    default:
        return nil
    }
}

if let aux = problem15("+"){
    print("\(num1) + \(num2) = \(aux(num1, num2))")
}

if let aux = problem15("-"){
    print("\(num1) - \(num2) = \(aux(num1, num2))")
}

if let aux = problem15("*"){
    print("\(num1) * \(num2) = \(aux(num1, num2))")
}

if let aux = problem15("/"){
    print("\(num1) / \(num2) = \(aux(num1, num2))")
}

if let aux = problem15("%"){
    print("\(num1) % \(num2) = \(aux(num1, num2))")
}


