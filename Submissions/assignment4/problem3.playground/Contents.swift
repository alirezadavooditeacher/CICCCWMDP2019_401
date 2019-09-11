import Cocoa

var str = "Hello, playground"

class MyNotification {
    var seen:Bool = false
    var totalSeen:Int = 0
    
    // type method should be static and it is not necessary to be variable
    // the code below is incorrect
//    var searchIt = {(arr:[Int], boolean:((Int) -> Bool)) in print("aaa")}
    
    static func searchIt(arr:[Int], boolean:(Int) -> Bool){
        var isPredicateHold1 = false
        for value in arr {
            if boolean(value){
                isPredicateHold1 = true
                MyObserver.update(isPredicatedHold: isPredicateHold1, item: value)
            }
            // if the number is true that predicate 1 return, the number should be input in the prameter of the myobserver.
        }
    }
    
    static func fillIt(_ size:Int) -> [Int] {
        var arrResult:[Int] = []
        for _ in 0..<size {
            let num = Int.random(in: 0...100)
            arrResult.append(num)
        }
        return arrResult
    }
}

func predicate1(num:Int) -> Bool{
    return num % 3 == 0
}

func predicate2(num:Int) -> Bool{
    return num % 2 == 0
}

// myobserver should be created here
// sum and how many times the num in the array was imformed to myobserver.

class MyObserver{
    static var count = 0
    static var sum = 0
    
    static func update(isPredicatedHold: Bool , item: Int) {
        if isPredicatedHold {
            count += 1
            sum += item
        }
    }
    
}

let array = MyNotification.fillIt(10)
MyNotification.searchIt(arr: array, boolean: predicate1)
print("predicate1")
print(MyObserver.count)
print(MyObserver.sum)
MyNotification.searchIt(arr: array, boolean: predicate2)
print("predicate2")
print(MyObserver.count)
print(MyObserver.sum)

// インスタンスのメソッドを呼ぶときには、
// 直接クラスのファンクションを呼ぶときにクラス.ファンクションはNG!
// この場合インスタンスを生成する

// もし直接呼びたいときには、元のファンクションをstaticにしないといけない
// だが、staticにすると関数の中で使われている変数はもともと関数の外で初期化されているので、初期化されているところのプロパティはstaticにしないといけない。

//let array1 = MyNotification.fillIt(7)
//fillitArr.append(array1)
//let array2 = MyNotification.fillIt(8)
//fillArr.append(array2)


