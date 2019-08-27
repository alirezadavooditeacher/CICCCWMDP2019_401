import UIKit

//function or closure with 2 Int parameters and returns an Int
var func1:(Int, Int)->Int
//function or closure that reveives a String and doesn't have return
var func2:(String)->Void
//function or closure that doesn't have parameters and returns an Int
let func3:()->Int
//function or closure that doesn't receive any parameter and doesn't return enything
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
