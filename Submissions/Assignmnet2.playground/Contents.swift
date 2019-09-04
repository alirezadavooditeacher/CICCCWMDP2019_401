import UIKit



//Problem 1: Defining closure variables and constant

var func1: (Int, Int) -> Int
var func2: (String) -> Void
var func3: ()-> Int
var func4: ()->[()->Void]
var func5: ([(Int)->Void]) -> [String]
var func6: ([(Int)->Void]) -> [(Int)->Void]
var func7: ([(Int)->Void]?) -> [(Int)->Void]?
var func8:  ([(Int)->Void]?) -> [(Int)->Void]?
var func9: () -> ((Int)->Int, Int)?

//---------------------------------
//Problem 2: Dummy functions

//1
func fakeFuntion1(i1: Int, i2:Int) -> Int {
    return i1+i2
}
func1 = fakeFuntion1;

//2
func fakeFuntion2(i1: String) -> Void {
    print(i1)
}
func2 = fakeFuntion2;

//3
func fakeFuntion3() -> Int {
    return 5
}
func3 = fakeFuntion3;

//4
func fakeFuntion4() -> [()->Void] {
    
    func fakeFuntionConten1()
    {
        
    }
    func fakeFuntionConten2()
    {
        
    }
    return [fakeFuntionConten1, fakeFuntionConten2]
}
func4 = fakeFuntion4;


//5
func fakeFuntion5(condition: [(Int) -> Void]) -> [String] {
    
    condition
    
    return ["hello", "hello1"]
}
func5 = fakeFuntion5;

//6
func fakeFuntion6(condition : [(Int)->Void]) -> [(Int)->Void] {
    return condition
}
func6 = fakeFuntion6;

//7
func fakeFuntion7(condition: [(Int)->Void]?) -> [(Int)->Void]? {
    for index in condition!
    {
        index
    }
    
    return condition
}
func7 = fakeFuntion7;

//8
func fakeFuntion8(condition: [(Int)->Void]?) -> [(Int)->Void]? {
    for index in condition!
    {
        index
    }
    
    return condition
}
func8 = fakeFuntion8;


//9
func fakeFuntion9() -> ((Int)->Int, Int) {
    
    func addOne1(number: Int) -> Int {
        return (number)
    }
    func addOne2(number: Int) -> Int {
        return (number)
    }
    return (addOne1, 0)
}
func9 = fakeFuntion9;



//-------------------------------------------
//Problem3: A Calculator


var arr: [String] = ["5","6","8","6","8"]

func sum(a: Int, b:Int) -> Int
{
    return (a + b)
}
func division(a: Int, b:Int) -> Double
{
    return Double(a/b)
}


func difference(a: Int, b:Int)
{
    if a > b
    {
        print("\(a) > \(b)", "difference")
    }
    print("\(b) > \(a)", "difference")
}

func power(a: Int, b:Int) ->Double
{
    return pow(Double(a),Double(b))
}

func multiplication(a: Int, b:Int) ->Double
{
    return Double(a * b)
}

func calculator(){
    let a = 8
    let b = 9
    print(sum(a: a, b: b), "Sum")
    print(division(a: a, b: b), "division")
    difference(a: a, b: b)
    print(power(a: a, b: b),"power")
    print(multiplication(a: a, b: b),"multiplication")
}

calculator()

//------------------------------------------------------
//Problem4 : Sorted()

//Alphabetically Ascendingly
let list1: Set = ["one", "two", "three", "four", "five"]
let descendinglist1 = list1.sorted(by: >)
print(descendinglist1)
//Alphabetically Descending
let list2: Set = ["one", "two", "three", "four", "five"]
let descendinglist2 = list2.sorted(by: >)
print(descendinglist2)
//Descending based on the length of the items
var list3: [String] = ["aa", "aba", "b", "aabbb"]
let descendinglist3 = list3.sorted {$0.count > $1.count}
print(descendinglist3)


//---------------------------------------------------
//Problem5: Query Builder

var arr:[Int] = [8,5,6,7,4,5,8,7]


//Predicate1: Returns true if a number is odd
func Predicate1(i: Int) ->Bool
{
    if i % 2 == 0
    {
        return false
    }
    return true
}

//Predicate2: Returns true if a number is prime
func Predicate2(n: Int) ->Bool
{
    if n <= 1{
        return false
    }
    if n <= 3{
        return true
    }
    
    var i = 2
    while i*i <= n
    {
        if n % i == 0
        {
            return false
        }
        i = i + 1
    }
    return true
}
//Predicate3: Returns true if a number is prime and odd
func Predicate3(n: Int) ->Bool
{
    if n <= 1{
        return false
    }
    if n <= 3{
        if n == 2
        {
            return false
        }
        return true
    }
    
    var i = 2
    while i*i <= n
    {
        if n % i == 0
        {
            return false
        }
        i = i + 1
    }
    return true
}
//Predicate4: Returns true if a number is divisible by 7
func Predicate4(i: Int) ->Bool
{
    if i % 7 == 0
    {
        return true
    }
    return false
}

func Main()
{
    var P1: String = "a number is prime: \n"
    var P2: String = "a number is prime: \n"
    var P3: String = "a number is prime and odd: \n"
    var P4: String = "a number is divisible by 7 : \n"
    for index in arr
    {
        
        P1 += "\(index) = \(Predicate1(i: index)) \n"
        
        P2 += "\(index) = \(Predicate2(n: index)) \n"
        
        P3 += "\(index) = \(Predicate3(n: index)) \n"
        
        P4 += "\(index) = \(Predicate4(i: index)) \n"
        
        
        
    }
    
    print(P1)
    print(P2)
    print(P3)
    print(P4)
    
}
Main()

