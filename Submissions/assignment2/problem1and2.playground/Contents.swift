import UIKit

// Problem 1,2 ------------------------------------------------------------------------
/*
 -Problem 1: Defining closure variables and constant
 
 -Problem 2: Dummy functions
 For each of the variable/constant above define a dummy function and assign the corresponding variables or constants to them.
 上記の変数/定数のそれぞれについて、ダミー関数を定義し、対応する変数または定数をそれらに割り当てます。
 
 For instance:
 • Variable called func0 whose type is String->Void
 • var func0: (String)->Void
 func fakeFuntion0 (s: String) -> Void {
 print(s)
 }
 func0 = fakeFuntion0;
 */

var func0: (String)->Void
func fakeFuntion0 (s: String) -> Void {
    print(s)
}
func0 = fakeFuntion0;

var func1: (Int, Int) -> Int
func fakeFunction1 (_ n1: Int, _ n2: Int) -> Int {
    return n1 + n2
}
func1 = fakeFunction1;



var func2: (String) -> Void
func fakeFunction2 (_ w: String) -> Void {
    print(w)
}
func2 = fakeFunction2;



let func3: () -> Int
func fakeFunction3 () -> Int {
    return 100
}
func3 = fakeFunction3;



let func4: () -> [() -> Void] // 配列の中に入った関数が返り値
func fakeFunction4 () -> [() -> Void] {
    //    return
    
    func nestedFunc() -> Void {
        print()
    }
    
    return [nestedFunc]
    
}
func4 = fakeFunction4;



let func5: ([(Int) -> Void]) -> [String] //（）の意味はただ「配列の中に入ったファンクションを受け取る」というだけ
func fakeFunction5 (_: [(Int) -> Void]) -> [String] {
    var listF5 = ["str1","str2","str3"]
    return listF5
}
func5 = fakeFunction5;



var func6: ([(Int)->Void]) -> [(Int) -> Void]
func fakeFunction6 (_: [(Int)->Void]) -> [(Int) -> Void] {
    func forFake6 (_ numF6: Int) {
        print(numF6)
    }
    return [forFake6]
}
func6 = fakeFunction6;



var func7: ([(Int) -> Void]?) -> [(Int) -> Void]?
func fakeFunction7 (_: [(Int) -> Void]?) -> [(Int) -> Void]? {
    
    func forFake7 (_ numF7: Int){
        print(numF7)
    }
    
    let listOfFakes = [forFake7]
    let word = "123"
    if let _ = Int(word) {
        return listOfFakes
    } else {
        return nil
    }
}
func7 = fakeFunction7;
//func7(fakeFunction7(nil))


var func8: ([(Int) -> Void]?) -> [(Int)->Void]?
func fakeFunction8 (_: [(Int) -> Void]?) -> [(Int)->Void]? {
    func forFake8 (_ numF8: Int){
        print(numF8)
    }
    return [forFake8]
}
func8 = fakeFunction8;



var func9: () -> ((Int)->Int, Int)?
func fakeFunction9 () -> ((Int)->Int, Int)? {
    func forFake9 (a: Int)-> Int{
        return 1
    }
    
    let a = forFake9(a:3)
    if a==1 {
        return (forFake9, a)
    } else {
        return nil
    }
}
func9 = fakeFunction9;
