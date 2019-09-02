import UIKit
//prombem1
var func1: (Int,Int) -> Int
var func2: (String) -> Void
let func3: () -> Int
let func4: () -> [()->Void]
let func5: ([(Int)->Void]) -> [String]
var func6: ([(Int)->Void]) -> [(Int)->Void]
var func7: ([(Int)->Void]?) -> [(Int)->Void]?
var func8: ([(Int)->Void]?) -> [(Int)->Void]?
var func9: () -> ((Int)->Int, Int)?

//promblem2-1
let f1 = {(a:Int, b:Int) -> Int in
    print("f1:\(a)+\(b)=\(a+b)")
    return a+b
}
func1 = f1
func1(1,2)

//promblem2-2
let f2 = {(s:String) -> Void in
    print(s)
}
func2 = f2
f2("f2:hi")

//promblem2-3
let f3 = {()-> Int in
    let a = 3
    print("f3:\(a)")
    return a
}
var ff3 = f3
ff3()

//promblem2-4
var func44 :[()->Void]
let f4 = {() -> [()->Void] in
    func f4c()->Void{
        print("f4:A")
    }
    
    func f4d()->Void{
        print("f4:B")
    }
    return [f4c,f4d]
}
func44 = f4()
func44[0]()
func44[1]()

//promblem2-5
func f5(closure: [(Int) -> Void] ) -> [String]{
    closure[0](8)
    closure[1](9)
    let s = ["f5:A","f5:B"]
    return s
}
let test5 = f5(closure: [{(a:Int) -> Void in print("f5a: \(a)")},
             {(b:Int) -> Void in print("f5b: \(b)")}])
print(test5)

//promblem2-6
func f6(closure:[(Int)->Void]) -> [(Int)->Void]{
    closure[0](6)
    
    func f6_1(in2:Int)->Void{
        print("f6_input2 = \(in2)")
    }
    return [f6_1]
}
f6(closure:[{(in1:Int)->Void in print("f6_input1 = \(in1)")}])
let test6 = f6(closure:[{(in1:Int)->Void in print("f6_input1 = \(in1)")}])
test6[0](66)

//promblem2-7
func f7(closure:[(Int)->Void]?)->[(Int)->Void]?{
    if let cl = closure{
        cl[0](7)
    }
    func f7_1(in2:Int)->Void{
        print("f7_input2 = \(in2)")
    }
    return [f7_1]
}
if let test7 = f7(closure:[{(in1:Int)->Void in print("f7_input1 = \(in1)")}]){
    test7[0](77)
}

//promblem2-8
func f8(closure:[(Int)->Void]?)->[(Int)->Void]?{
    if let cl = closure{
        cl[0](8)
    }
    func f8_1(in2:Int)->Void{
        print("f8_input2 = \(in2)")
    }
    return [f8_1]
}

if let test8 = f8(closure:[{(in1:Int)->Void in print("f8_input1 = \(in1)")}]){
    test8[0](88)
}

//promblem2-9
func f9()->((Int)->Int, Int)?{
    print("f9")
    let int2 = 99
    func f9_1(int2:Int)->Int{
        print("f9_input2 = \(int2)")
        return int2
    }
    let output1 = 9
    return (f9_1,output1)
}
print(f9()!)
//if let test9 = f9(){
//    test9(f9_1(9))
//}





