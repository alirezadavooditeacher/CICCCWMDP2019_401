import UIKit

//function or closure with 2 Int parameters and returns an Int
var func1:(Int, Int)->Int
//function or closure that reveives a String and doesn't have return
var func2:(String)->Void
//function or closure that doesn't have parameters and returns an Int
let func3:()->Int
//function or closure that doesn't receive any parameter and returns an array of function without parameter and without return
let func4:()->[()->Void]
//receives an array of function or closure with Int as parameter and no return and return an array of strings
let func5:([(Int)->Void])->[String]
//receives an array of function or closure with Int as paramenter and no return, and return an array of function with Int as paramente and no return
var func6:([(Int)->Void])->[(Int)->Void]
//receives an optional array of function or closure with Int as paramenter and no return, and return an optional array of function with Int as paramente and no return
var func7:([(Int)->Void]?)->[(Int)->Void]?
var func8:([(Int)->Void]?)->[(Int)->Void]?
//receives a function or closure with no paramenter and return an optional touple with function or closure that receives Int as parameter and return an Int, and another Int
var func9:()->((Int)->Int,Int)?

func fakeFunc1(num1:Int, num2:Int) -> Int {
    return num1 + num2
}
func1 = fakeFunc1

func fakeFunc2(str:String) {
    print(str)
}
func2 = fakeFunc2

func fakeFunc3() -> Int {
    return 0
}
func3 = fakeFunc3

func fakeFunc4() -> [()->Void] {
    return [{ () -> Void in print("Hello World") }]
}
func4 = fakeFunc4

func fakeFunc5(funcs:[(Int)->Void])->[String] {
    return ["Hello","World"]
}
func5 = fakeFunc5

func fakeFunc6(funcs: [(Int)->Void])->[(Int)->Void] {
    return [{ (Int) -> Void in print("Hello World") }]
}
func6 = fakeFunc6

func fakeFunc7(funcs: [(Int)->Void]?)->[(Int)->Void]? {
    
    guard funcs != nil else {
        return nil
    }
    
    return [{ (Int) -> Void in print("Hello World") }]
}
func7 = fakeFunc7

func fakeFunc9()->((Int)->Int,Int)? {
    return ({ (Int) -> Int in return 0 }, 1)
}
func9 = fakeFunc9
