import UIKit

/*
 Write a function which receives two number A and B as its parameters: First prints all numbers between A and B (A and B not included), which are divisible to both 3 and 5.
 Then prints all numbers between A and B (A included by B not included), which are divisible by either 6 or 7. Finally prints all numbers between A and B (A and B both included), which are not divisible by 3. Hint: Design a function for each sub problem and then call them inside another function.
 
 パラメーターとして2つの数値AとBを受け取る関数を作成します。最初に、AとBの間のすべての数値（AとBは含まれません）を印刷します。次に、AとBの間のすべての数字を印刷します（Bには含まれません）。6または7で割り切れます。最後に、AとBの間の数字をすべて印刷します（AとBの両方が含まれます）。 ：サブ問題ごとに関数を設計し、別の関数内で呼び出します。
*/

func between2Numbers (_ A:Int, _ B:Int) {
    var num = A + 1
    var list1 = [Int]()
    var list2 = [Int]()
    var list3 = [Int]()
    while (num<B){
        if (num%3) == 0 && (num%5) == 0 {
            list1.append(num)
        }
        if (num%6) == 0 || (num%7) == 0 {
            list2.append(num)
        }
        if !(num%3 == 0) {
            list3.append(num)
        }
        num += 1
    }
    list2.insert(A, at: 0)
    list3.insert(A, at: 0)
    list3.append(B)
    
    print(list1)
    print(list2)
    print(list3)
}

between2Numbers(18, 42)
