import UIKit

//Problem 1

func calculate(operator opt: String, num1: Int, num2: Int) -> Int {
    var result = 0

    switch opt {
    case "+":
        result = num1 + num2
    case "-":
        result = num1 - num2
    case "*":
        result = num1 * num2
    case "/":
        if num2 == 0 {
            print("Operation not possible!")
        } else {
            result = num1 / num2
        }
    default:
        result = 0
    }

    return result
}

calculate(operator: "+", num1: 10, num2: 10)
calculate(operator: "-", num1: 10, num2: 10)
calculate(operator: "*", num1: 10, num2: 10)
calculate(operator: "/", num1: 10, num2: 10)
calculate(operator: "/", num1: 10, num2: 0)

//Problem 2

func createShape(_ userShape: String) {
    var shape = "*****"
    var thirdShape = "*"

    switch userShape {
    case "shape1":
        while shape.count >= 1 {
            print(shape)
            if shape.count == 1 {
                shape.removeLast()
            } else {
                shape.removeFirst()
                shape.removeLast()
            }
        }
    case "shape2":
        while shape.count >= 1 {
            print(shape)
            shape.removeLast()
        }
    case "shape3":
        for _ in 1...5 {
            print(thirdShape)
            thirdShape += "*"
        }
    default:
        print("shape")
    }
}

createShape(_: "shape1")
createShape(_: "shape2")
createShape(_: "shape3")

//Problem 3

func addingNumbers(number: Int) -> Int? {
    let numberAsString = String(number)
    
    if number < 0 {
        return nil
    }


    let digits = numberAsString.compactMap{ $0.wholeNumberValue }

    let sum = digits.reduce(0, {x, y in
        x + y
    })

    return sum
}

addingNumbers(number: 120)

//Problem 4
func printDivisibles(num1: Int, num2: Int) {
    divisibleByThreeAndFive(startOfRange: num1, endOfRange: num2)
    divisibleBySixOrSeven(startOfRange: num1, endOfRange: num2)
    notDivisileByThree(startOfRange: num1, endOfRange: num2)
}


func divisibleByThreeAndFive(startOfRange a: Int, endOfRange b: Int) {
    for number in a...b {
        if number % 3 == 0 && number % 5 == 0 && number != a && number != b {
             print(number)
        }
    }
    print("---")
}

func divisibleBySixOrSeven(startOfRange a: Int, endOfRange b: Int) {
    for number in a...b {
        if number % 6 == 0 || number % 7 == 0 && number != a && number != b {
            print(number)
        }
    }
    print("---")
}

func notDivisileByThree(startOfRange a: Int, endOfRange b: Int) {
    for number in a...b {
        if number % 3 != 0 {
            print(number)
        }
    }
    print("---")
}

printDivisibles(num1: 1, num2: 100)



//Problem 5
func calculatingPower(a: Int, b: Int) {

    func F1(x: Int) -> Double {
       let result = pow(Double(a), Double(x))
        print(result)
        return result
    }

    func F2(x: Int) -> Double {
        let result = pow(Double(x), Double(b))
        print(result)
        return result
    }
}

calculatingPower(a: 2, b: 2)

//Problem 6
func swapInts(num1: inout Int, num2: inout Int) {
    print("num1 was: \(num1) and num2 was: \(num2)")
    let temporaryNum1 = num1
    num1 = num2
    num2 = temporaryNum1
    print("num1 is now: \(num1) and num2 is now: \(num2)")
}

var int1 = 10
var int2 = 5

swapInts(num1: &int1, num2: &int2)

//Problem 7

func checkForReversedString(string: String) -> (Int, String)? {
    let normalString = string

    let reversedString = String(string.reversed())

    if normalString == reversedString {
        print("Same")
        return (1, "Word reversed is the same as the normal world!")
    } else {
        print("Not the same!")
        return nil
    }
}

checkForReversedString(string: "car")
checkForReversedString(string: "ana")

//Problem 8

func searchIntegerInTheList(numbers: Int..., number: Int) {
    var message = ""
    for n in numbers {
        if n == number {
            message = "\(number) belongs to the list"
        } else {
            message = "\(number) does not belong to the list!"
        }
    }
    print(message)
}

searchIntegerInTheList(numbers: 8,4,5,7, number: 7)
searchIntegerInTheList(numbers: 8,4,5,7, number: 10)


//Problem 9
func removeInteger(listOfNumbers: inout [Int], numberToCheck: Int) -> [Int] {
    print("Old list: \(listOfNumbers)")
    for number in listOfNumbers {
        if number == numberToCheck {
            let numberToBeRemovedIndex = listOfNumbers.firstIndex(of: number)
            listOfNumbers.remove(at: numberToBeRemovedIndex!)
            print("New list: \(listOfNumbers)")
        }
    }
    return listOfNumbers
}

var numArray = [1, 3, 5, 8]

removeInteger(listOfNumbers: &numArray, numberToCheck: 5)

//Problem 10

func calculateGPA(students: [(String, Int, Int, Int, Int, Int)]) -> (String, Int) {
    var maxGPA = 0
    var name = ""
    for student in students {
        let sum = student.1 + student.2 + student.3 + student.4 + student.5
        let gpa = sum / 5
        if gpa > maxGPA {
            maxGPA = gpa
            name = student.0
        }
        
    }
    return (name, maxGPA)
}

calculateGPA(students: [("Lucas", 100, 20, 50, 80, 90), ("Shihomi", 100, 50, 50, 80, 70)])



//Problem 11
func checkForRepeatedNumber(numbers: [Int]) -> [Int:Int] {
    var countDict = [Int:Int]()

    for number in numbers {
        countDict[number] = (countDict[number] ?? 0) + 1
    }
    
    print(countDict)
    return countDict
}

checkForRepeatedNumber(numbers: [1, 2, 3, 4, 4, 4, 5])

//Problem 12
func removeRepeated(numbers: inout [Int]) -> [Int] {
    var num = 0
    for i in numbers {
        if i == num {
            let numberToBeRemovedIndex = numbers.firstIndex(of: i)
            let duplicateIndex = numbers.firstIndex(of: num)
            numbers.remove(at: numberToBeRemovedIndex!)
            numbers.remove(at: duplicateIndex!)
        } else {
            num = i
        }
    }
    print(numbers)
    return numbers
}

var array = [1, 2, 2, 3, 3, 5]

removeRepeated(numbers: &array)

//Problem 13

func wordsDictionary(words: [String]) -> [Character:[String]] {
    var dict = [Character:[String]]()
    for word in words {
        if let letter = word.first {
            if dict[letter] != nil {
                var newWord = dict[letter]!
                newWord.append(word)
                dict[letter]! = newWord.sorted()
            } else {
                dict[letter] = [word]
            }
        }
    }
    dict.keys.sorted(by: <)
    print(dict)
    return dict
}

wordsDictionary(words: ["Rose", "Hi", "Hello", "car"])

//Problem 14

func sortString(sorting: (String,String) -> Bool, strings: [String]) {
    strings.sorted(by: sorting)
}

func sortingASC(s1: String, s2: String) -> Bool {
    if s1 < s2 {
        return true
    } else {
        return false
    }
}

func sortingDESC(s1: String, s2: String) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}

sortString(sorting: sortingASC(s1:s2:), strings: ["Car", "Apple", "Boat"])
sortString(sorting: sortingDESC(s1:s2:), strings: ["Car", "Apple", "Boat"])

//Problem 15

func calculator(_ opt: Character) -> ((Int, Int)->Int)? {

    func sum(_ num1: Int, _ num2: Int) -> Int {
        return num1 + num2
    }

    func sub(_ num1: Int, _ num2: Int) -> Int {
        return num1 - num2
    }

    func multiply(_ num1: Int, _ num2: Int) -> Int {
        return num1 * num2
    }


    func division(_ num1: Int, _ num2: Int) -> Int {
        return num1 / num2
    }

    func divisible(_ num1: Int, _ num2: Int) -> Int {
        return num1 % num2
    }

    switch opt {
    case "+":
        return sum
    case "-":
        return sub
    case "*":
        return multiply
    case "/":
        return division
    case "%":
        return divisible
    default:
        return nil
    }
}

let num1 = 32
let num2 = 10

var result = 0

if let calculation = calculator("+") {
    print(calculation(num1, num2))
}

if let calculation = calculator("-") {
    print(calculation(num1, num2))
}

if let calculation = calculator("*") {
    print(calculation(num1, num2))
}

if let calculation = calculator("/") {
    print(calculation(num1, num2))
}

if let calculation = calculator("%") {
    print(calculation(num1, num2))
}


