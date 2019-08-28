import UIKit

// A variable called func1 whose type is (Int, Int) -> Int
var func1 : (Int, Int) -> Int
func fakeFunc1(int1:Int, int2:Int) -> Int { return int1 + int2 }
func1 = fakeFunc1
func1(1,2)

// A variable called func2 whose type is (String) -> Void
var func2 : (String) -> Void
func fakeFunc2(str1:String) -> Void{ print("\(str1)")}
func2 = fakeFunc2
func2("AAA")

// A constant called func3 whose type is ()-> Int
let func3 : ()->Int
func fakeFunc3() -> Int { return 123 }
func3 = fakeFunc3
func3()

//o A constant called func4 whose type is ()->[()->Void]
let func4 : ()->[()->Void]
func fakeFunc4() -> [()->Void] {
    
    func fakeFunc4A() -> Void {
        print("fakeFunc4A")
    }
    
    func fakeFunc4B() -> Void {
        print("fakeFunc4B")
    }
    return [fakeFunc4A,fakeFunc4B]
}
func4 = fakeFunc4
func4()[0]()
func4()[1]()

//o A constant called func5 whose type is ([(int)->Void]) -> [String]
let func5 : ([(Int)->Void]) -> [String]
let closure5:[(Int)->Void] = [{(intFunc5:Int)->Void in print("closure5[0]:\(intFunc5)")},{(intFunc5:Int)->Void in print("closure5[1]:\(intFunc5)")}]
func fakeFunc5(closure5:[(Int)->Void]) -> [String]{
    closure5[0](7)
    closure5[1](5)
    let strReturnArray = ["Success func5","B"]
    return strReturnArray
}
func5 = fakeFunc5
func5(closure5)


//o A variable called func6 whose type is ([(int)->Void]) -> [(int)->void]
var func6 : ([(Int)->Void]) -> [(Int)->Void]
let closure6: [(Int)->Void] = [{(intFunc6:Int)->Void in print("closure6[0]:\(intFunc6)")},{(intFunc6:Int)->Void in print("closure6[1]:\(intFunc6)")} ]
func fakeFunc6(closure6:[(Int)->Void]) -> [(Int)->Void]{
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

func6 = fakeFunc6
func6(closure6)[0](9)
func6(closure6)[1](1)

//o A variable called func7 whose type is ([(int)->Void]?) -> [(int)->void]?
//o A variable called func8 whose type is ([(int)->Void]?) -> [(int)->void]?
var func7 : ([(Int)->Void]?) -> [(Int)->Void]?
let closure7: [(Int)->Void]? = [{(intFunc7:Int)->Void in print("closure7[0]:\(intFunc7)")},{(intFunc7:Int)->Void in print("closure7[1]:\(intFunc7)")} ]
func fakeFunc7(closure7:[(Int)->Void]?) -> [(Int)->Void]?{
    closure7?[0](4)
    closure7?[1](3)
    
    func func7A(a:Int)->Void{
        print("func7A:\(a)")
    }
    
    func func7B(b:Int)->Void {
        print("func7B:\(b)")
    }
    return [func7A,func7B]
}

func7 = fakeFunc7
func7(closure7)?[0](9)
func7(closure7)?[0](9)



//o A variable called func9 whose type is () -> ((Int)->Int, Int)?
var func9 : () -> ((Int)->Int, Int)?
func fakeFunc9()->((Int)->Int,Int)?{
    
    func func9A(a:Int)->Int{
        
        var func9A1 = a
        
        return func9A1
    }
    
    return (func9A(a:),1)
    
}

func9 = fakeFunc9
print("\(func9())")





