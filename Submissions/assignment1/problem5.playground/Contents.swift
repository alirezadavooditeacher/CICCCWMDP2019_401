import UIKit

/*
 - Write a function which receives 2 number A and B as input parameter. Then using A and
 B, the function considers calculating two mathematical functions:
 F1(x) = A^x
 F2(x) = x^B
 
 - The program should find the positive number (and greater than 2), (let’s call is T) which has the following characteristic:
 • For all numbers which are less than T we have F1(x)< F2(x)
 • For all numbers which are greater than or equal T we have F1(x)> F2(x)
 
 - Hint: Define two functions one for calculating F1(x) and one for calculating F2(x). The function returns the result based on given A, B and x.
 
 - Use both argument label and parameter name for the input parameters in the functions in this problem.
*/


func findT (_ A: Double, _ B: Double) {
    var T: Double = 2
    
    func F1(_ A: Double, _ T: Double) -> Double {
        let f1 = pow(A, T)
        return f1
    }
    
    func F2(_ T: Double, _ B: Double) -> Double {
        let f2 = pow(T, B)
        return f2
    }
    // ここから少し曖昧s
    let f1: (Double, Double) -> Double = F1
    let f2: (Double, Double) -> Double = F2
    while f1(A,T) < f2(T,B) {
        T += 1
    }
    print(T)
}


findT(2, 5)
