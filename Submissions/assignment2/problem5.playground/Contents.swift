import UIKit

/* Problem 5: Ouery Builder ----------------------------------------------------------
 Write a function called filter which has two input parameters:
 1- A list of numbers (positive integers)
 2- An array of predicates. (A predicate is a function type of type (Int)->Bool).
 
 And returns an Optional Array of Integer.
 
 Them define the following constant predicate and add them to a list of predicates.
 
 Predicate1: Returns true if a number is odd
 Predicate2: Returns true if a number is prime
 Predicate3: Returns true if a number is prime and odd
 Predicate4: Returns true if a number is divisible by 7
 Add the above predicates to a list of predicates.
 Then implement the filter function mentioned above. The filter function return the list of all numbers from the input list on which all predicates return true.
 次に、上記のfilter functionを実装します。
 filter functionは、すべてのpredicatesがtrueを返す入力リストからすべての数値のリストを返します。
 */

func filter (_ numlist: [Int], _ predicates: [(Int) -> Bool]) -> [Int]? {
    
    var list : [Int] = []
    
    for num in numlist {
        
        if predicates.count==4 {
            let predicate1 = predicates[0]
            let predicate2 = predicates[1]
            let predicate3 = predicates[2]
            let predicate4 = predicates[3]
            
            if predicate1(num) && predicate2(num) && predicate3(num) && predicate4(num) {
                list.append(num)
            }
        } else {
            print("Error")
        }
    }
    
    return list
}

let num = 6

func predicate1 (_ num: Int) -> Bool {
    if num % 2 != 0 {
        return true
    } else {
        return false
    }
}

func predicate2 (_ num: Int) -> Bool {
    if num % 2 == 0 {
        return true
    } else {
        return false
    }
    
}

func predicate3 (_ num: Int) -> Bool {
    if num % 2 != 0 || num % 2 == 0 {
        return true
    } else {
        return false
    }
}


func predicate4 (_ num: Int) -> Bool {
    if num % 7 == 0 {
        return true
    } else {
        return false
    }
}

let result = filter([1,2,20,43,67,12,90,11], [predicate1,predicate2,predicate3,predicate4])
if let res = result {
    print(res)
}
