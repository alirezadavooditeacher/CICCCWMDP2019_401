import UIKit

/* Problem3: Property Observers
 
 Define a class call MyNotification which contains a property called seen of type Boolean and a property called totalSeen of type int.
 • The class has a type method called searchIt which takes an array of number and a functional type called predicate of type (int)->Bool.
 • The class has a another type method called fillIt which receives an input called size (of type int) and return an array with the size of the number. The fillIt method generates some random numbers between 1-100 to populate an array and return the array.
 • クラスには、fillItと呼ばれる別の型メソッドがあり、size（int型）という入力を受け取り、数値のサイズの配列を返します。 fillItメソッドは、1〜100の乱数を生成して配列にデータを入力し、配列を返します。
 
 • The array produced by the fillIt method is then given to searchIt method.
 • fillItメソッドで生成された配列は、searchItメソッドに渡されます。
 
 • Then define a 2 arbitrary predicates like
 o Predicate1: The number is dividend of 3
 o Predicate2: The number is an even number.
 
 • Call the searchIt function once with Predicate1 and once with Predicate2.
 • The searchIt function will iterate over the input array and apply the predicate to the items of
 the array. Any time, the predicate return true, you should inform another class called
 MyObserver.
 • searchIt関数は、入力配列を反復処理し、predicateを配列の項目に適用します。 predicateがtrueを返すときはいつでも、MyObserverと呼ばれる別のクラスに通知する必要があります。
 
 • At each time the predicate holds, the MyObserver class is notified about two things:
 o 1- The fact that the predicate holds
 o 2- The item in the array on which the predicate holds
 • At the end of running each predicate on the array the MyObserver class will know about
 the following:
 o Number of times the predicate holds
 o The sum of numbers on which the predicate holds.
 • At the end the MyObserver class will print the following info: (the numbers re just examples)
 o Predicate1: number of holds: 10 total: 87
 o Predicate2: number of holds: 11 total: 81
 You should use the property observers to solve this problem.
 
 •predicateが保持されるたびに、MyObserverクラスには次の2つのことが通知されます。
     o 1-predicateが保持するという事実　trueがあるということ？
     o 2-predicateが保持する配列内のアイテム　trueの数値？
 •配列で各predicateの実行が終了すると、MyObserverクラスが認識します
     以下：
     o predicateが保持する回数 trueの回数？
     o predicateが保持する数の合計。 trueのすべての数値の合計
 •最後に、MyObserverクラスは次の情報を出力します：（数字は単なる例です）
     o predicate1：保留数：10合計：87
 o predicate2：保留数：11合計：81
     この問題を解決するには、プロパティオブザーバーを使用する必要があります。
 */

class MyNotification {
    var seen: Bool = false  // classを使うときは初期値を代入しないとエラーになる
    var totalSeen: Int = 0
    let myObserver = MyObserver()
    
    func searchIt (_ randomarray: [Int], _ predicate: (Int) -> Bool ) {
        for num in randomarray {
            if predicate(num) == true {
                self.seen = true
                myObserver.holdsCnt += 1
                myObserver.total += num
            }
            
        }
        print(randomarray)
        myObserver.printHoldsCntAndTotal()
    }
    
    func fillIt (_ size: Int) -> [Int] {
        var cnt = 0
        var randomarray = [Int]()
        while cnt <= size {
            cnt += 1
            let num = Int.random(in: 1...100)
            randomarray.append(num)
        }
        return randomarray
    }
    
    // "predicate" means function which returns boolean.
    func predicate1 (_ num: Int) -> Bool {
        if (num % 3) == 0 {
            return true
        } else {
            return false
        }
    }
    
    func predicate2 (_ num: Int) -> Bool {
        if (num % 2) == 0 {
            return true
        } else {
            return false
        }
    }
    
}

class MyObserver {
    var holdsCnt = 0
    var total = 0
    
    func printHoldsCntAndTotal() {
        print("number of holds: \(holdsCnt)  total: \(total)\n")
    }
    
}

let myNotification = MyNotification()
let randomarray = myNotification.fillIt(5)
print("---predicate1---------------------")
myNotification.searchIt(randomarray, myNotification.predicate1)
print("---predicate2---------------------")
myNotification.searchIt(randomarray, myNotification.predicate2)
