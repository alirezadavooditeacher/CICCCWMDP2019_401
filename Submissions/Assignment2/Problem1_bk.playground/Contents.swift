import UIKit
//
//// A variable called func1 whose type is (Int, Int) -> Int
//var func1 : (Int, Int) -> Int
//// A variable called func2 whose type is (String) -> Void
//var func2 : (String) -> Void
//// A constant called func3 whose type is ()-> Int
//let func3 : ()->Int
////o A constant called func4 whose type is ()->[()->Void]
//let func4 : ()->[()->Void]
////o A constant called func5 whose type is ([(int)->Void]) -> [String]
//let func5 : ([(int)->Void]) -> [String]
////o A variable called func6 whose type is ([(int)->Void]) -> [(int)->void]
//var func6 : ([(int)->Void]) -> [(int)->void]
////o A variable called func7 whose type is ([(int)->Void]?) -> [(int)->void]?
////o A variable called func8 whose type is ([(int)->Void]?) -> [(int)->void]?
//var func7 : ([(Int)->Void]?) -> [(Int)->Void]?
////o A variable called func9 whose type is () -> ((Int)->Int, Int)?
//var func9 : () -> ((Int)->Int, Int)?








// A variable called func1 whose type is (Int, Int) -> Int
let func1 = { (int1:Int, int2:Int) -> Int in return int1 + int2}
func1(1,2)

// A variable called func2 whose type is (String) -> Void
let func2 = { (str1:String) -> Void in print("Success")}
func2("AAA")

// A constant called func3 whose type is ()-> Int
let func3 = { () -> Int in 123}
func3()

// A constant called func4 whose type is ()->[()->Void]
let func4 = { () -> [()->Void] in
    
    func a() -> Void {
        print("func A")
    }
    
    func b() -> Void {
        print("func B")
    }
    return [a,b]
}
let f4 = func4()
f4[0]()
f4[1]()


// A constant called func5 whose type is ([(int)->Void]) -> [String]
func func5(closure5:[(Int)->Void]) -> [String]{
    closure5[0](7)
    closure5[1](5)
    let strReturnArray = ["Success func5","B"]
    return strReturnArray
}

let func5Return = func5(closure5: [{(intFunc5:Int)->Void in print("1:\(intFunc5)")},
                                   {(intFunc5:Int)->Void in print("2:\(intFunc5)")},
                                    ])

// A variable called func6 whose type is ([(int)->Void]) -> [(int)->void]
func func6(closure6:[(Int)->Void]) -> [(Int)->Void]{
    closure6[0](7)
    closure6[1](3)

    func func6A(a:Int)->Void{
        print("func6A:\(a)")
    }
    
    func func6B(b:Int)->Void {
        print("func6B:\(b)")
    }
    return [func6A(a:),func6B(b:)]
}

let func6Return = func6(closure6: [{(intFunc6:Int)->Void in print("closure6[0]:\(intFunc6)")},
                                   {(intFunc6:Int)->Void in print("closure6[1]:\(intFunc6)")} ])
func6Return[0](9)
func6Return[1](1)

// A variable called func7 whose type is ([(int)->Void]?) -> [(int)->void]?
func func7(closure7:[(Int)->Void]?) -> [(Int)->Void]?{
    closure7?[0](4)
    closure7?[1](3)
    
    func func7A(a:Int)->Void{
        print("func7A:\(a)")
    }
    
    func func7B(b:Int)->Void {
        print("func7B:\(b)")
    }
    return [func7A,func7B,]
}

let func7Return = func7(closure7: [{(intFunc7:Int)->Void in print("closure7[0]:\(intFunc7)")},
                                   {(intFunc7:Int)->Void in print("closure7[1]:\(intFunc7)")} ])
func7Return?[0](9)
func7Return?[1](1)

// A variable called func8 whose type is ([(int)->Void]?) -> [(int)->void]?
func func8(closure8:[(Int)->Void]?) -> [(Int)->Void]?{
    closure8?[0](4)
    closure8?[1](3)
    
    func func8A(a:Int)->Void{
        print("func8A:\(a)")
    }
    
    func func8B(b:Int)->Void {
        print("func8B:\(b)")
    }
    return [func8A,func8B]
}

let func8Return = func8(closure8: [{(intFunc8:Int)->Void in print("closure8[0]:\(intFunc8)")},
                                   {(intFunc8:Int)->Void in print("closure8[1]:\(intFunc8)")} ])
func8Return?[0](9)
func8Return?[1](1)

// A variable called func9 whose type is () -> ((Int)->Int, Int)?
func func9()->((Int)->Int,Int)?{
    
    func func9A(a:Int)->Int{
        
        var func9A1 = a
        
        return func9A1
    }
    
    return (func9A(a:),1)
    
}

let func9Return = func9()
func9Return



