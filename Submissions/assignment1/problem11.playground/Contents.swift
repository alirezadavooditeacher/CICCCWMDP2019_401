import UIKit

/*
 Implement a function with receives a list of integer as input. The list might have repeated numbers. The function return a tuple of two numbers. The first number is the number that is repeated the most and the second number is the number of times the number is repeated. If the input list is empty the function will return nil instead.
 入力として整数のリストを受け取る関数を実装します。 リストには番号が繰り返される場合があります。 この関数は、2つの数値のタプルを返します。 最初の数は最も繰り返される数であり、2番目の数は数が繰り返される回数です。 入力リストが空の場合、関数は代わりにnilを返します。
*/


func theMostNumber (_ numbers: [Int]) {
    var repeatedlist = [Int]()
    var numcnt = -1
    print("list\n\(numbers)\n")
    
    
    for i in numbers {
        for j in numbers {
            if i == j {
                numcnt += 1
            }
        }
        repeatedlist.append(numcnt)
        numcnt = -1
    }
    
    print("repeated list\n\(repeatedlist)\n")
    
    var currentMax = repeatedlist[0]
    for value in repeatedlist[1..<repeatedlist.count] {
        if value > currentMax {
            currentMax = value
        }
    }

    for k in repeatedlist {
        if let index = repeatedlist.index(of: k){
            if currentMax == k {
                print("num: \(numbers[index])\nrepeated: \(currentMax)")
                break
            }
        }
    }
}
theMostNumber([1,5,2,6,7,5,1,5])
