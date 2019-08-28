 import UIKit

//Problem 1
 
 var func1 : (Int, Int) -> Int
 var func2 : (String) -> Void
 var func3 : () -> Int
 var func4 : () -> [() -> Void]
 var func5 : ([(Int) -> Void]) -> String
 var func6 : ([(Int) -> Void]) -> [(Int) -> Void]
 var func7 : ([(Int) -> Void]?) -> [(Int) -> Void]?
 var func8 : ([(Int) -> Void]?) -> [(Int) -> Void]?
 var func9 : () -> ((Int) -> Int, Int)
 
 func addingTwoNumbers(num1: Int, num2: Int) -> Int {
    let result = num1 + num2
    return result
 }
 
 func1 = addingTwoNumbers

 //------------------------------
 
 func printString(word: String) {
    print(word)
 }
 
 func2 = printString
 
 //------------------------------
 
 func myAge() -> Int {
    let age = 19
    return age
 }
 
 func3 = myAge
 
 //------------------------------
 
 func getFunction() -> [() -> Void] {
    var array = [() -> Void]()
    func printhello() {
        print("Hello")
    }
    
    array.append(printhello)
    
    return array
 }
 
 func4 = getFunction
 
 //----------------------------
 
 func getString(array : [(Int) -> Void]) -> String {
    let arrayCount = ("\(array.count)")
    return arrayCount
 }
 
 func5 = getString
 
 //-----------------------------
 
 func getFunctionTypeArray(array : [(Int) -> Void]) -> [(Int) ->    Void] {
    return array
 }
 
 func6 = getFunctionTypeArray
 
 //-----------------------------
 
 func getOptionalFunctionTypeArray(array : [(Int) -> Void]?) -> [(Int) ->    Void]? {
    return array
 }
 
 func7 = getOptionalFunctionTypeArray
 
 //------------------------------
 
 func getOptionalFunctionTypeArray2(array : [(Int) -> Void]?) -> [(Int) ->    Void]? {
    return array
 }
 
 func8 = getOptionalFunctionTypeArray2
 
 //------------------------------
 
 func giveRandomNumber() -> ((Int) -> Int, Int) {
    let randomNum = Int.random(in: 0 ..< 10)
    
    func randomMultiply(num : Int) -> Int {
        let result = num * randomNum
        
        return result
    }
    
    return (randomMultiply, randomNum)
 }

 
 // Problem 3
 
 func calculator(num1: Int, num2: Int, operation: String) -> (Double?, String)? {
 
    var result : Double = 0
    
     func sum(num1: Int, num2: Int) -> Double {
        result = Double(num1 + num2)
        return result
     }
    
     func division(num1: Int, num2: Int) -> Double? {
        if num2 == 0 {
            return nil
        } else {
            result = Double(num1 / num2)
            return result
        }
     }
    
     func difference(num1: Int, num2: Int) -> Double {
        result = Double(num1 - num2)
        return result
     }
    
     func power(num1: Int, num2: Int) -> Double {
        result = pow(Double(num1), Double(num2))
        return result
     }
    
     func multiplication(num1: Int, num2: Int) -> Double {
        result = Double(num1 * num2)
        return result
     }
    
     var operationList = ["sum": sum,
                          "division": division,
                          "difference": difference,
                          "power": power,
                          "multiplication": multiplication]
    
    if let f = operationList[operation] {
        let calculation = f(num1, num2)
        return (calculation, operation)
    } else {
        return nil
    }
    
 }
 
 let operations = ["sum", "division", "difference", "power", "multiplication"]
 
 for operation in operations {
    let randomNum1 = Int.random(in: 0 ..< 10)
    let randomNum2 = Int.random(in: 0 ..< 10)

    if let (result, opr) = calculator(num1: randomNum1, num2: randomNum2, operation: operation) {
        if let answer = result {
            print("Result: \(answer), operation: \(opr)" )
        }
    }
 }
 
 //Problem 4
 
 func sorter(words: [String], comparator: (String, String) -> Bool) -> [String]? {
    if words.isEmpty {
        return nil
    } else {
        let newArray = words.sorted(by: comparator)
        return newArray
    }
 }
 
 var words = ["Bike", "Apple", "Car"]
 
 
 
 let sortedWordsASC = sorter(words: words)  { (_ s1, _ s2) -> Bool in s1 < s2 }!
 print(sortedWordsASC)
 
 let sortedWordsDESC = sorter(words: words) { (_ s1, _ s2) in s1 > s2 }!
 print(sortedWordsDESC)

 let sortedWordsByLength = sorter(words: words) { (_ s1, _ s2) in s1.count > s2.count }!
print(sortedWordsByLength)
 
 // Problem 5
 
 func filter(numbers:[Int], predicateArray: [(Int) -> Bool]) -> [Int]? {
    var filteredNumbers = [Int]()
    for n in numbers {
        var append = true
        for predicate in predicateArray {
            if !predicate(n) {
                append = false
                break
            }
        }
        if append {
            filteredNumbers.append(n)
            print(filteredNumbers)
        }
        
    }
    return filteredNumbers
 }
 
 var arrayOfPredicates = [(Int) -> Bool]()
 
 let predicate1 = {(_ num:Int) -> Bool in num % 2 != 0}
 arrayOfPredicates.append(predicate1)
 
 let predicate2 = {(_ num:Int) -> Bool in
    if num > 1 {
        for n in 2..<num {
            if num % n == 0 {
                return false
            }
        }
        return true
    } else {
        return false
    }
    
 }
 arrayOfPredicates.append(predicate2)
 
 let predicate3 = {(_ num:Int) -> Bool in
    if num > 1 && num % 2 != 0 {
        for n in 2..<num {
            if num % n == 0 {
                return false
            }
        }
        return true
    } else {
        return false
    }
    
 }
 arrayOfPredicates.append(predicate3)
 
 let predicate4 = {(_ num:Int) -> Bool in num % 7 == 0}
 arrayOfPredicates.append(predicate4)
 
 var numbersArray = [Int](1...100)
 
filter(numbers: numbersArray, predicateArray: arrayOfPredicates)
