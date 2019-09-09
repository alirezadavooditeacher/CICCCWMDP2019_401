import UIKit

/* Problem6 HackerRank / Missing Number
 Solve the Missing number problem is Swift.
 https:www.hackerrank.com/challenges/missing-numbers/problem
 
 Numeros the Artist had two lists that were permutations of one another. He was very proud. Unfortunately, while transporting them from one exhibition to another, some numbers were lost out of the first list. Can you find the missing numbers?
 As an example, the array with some numbers missing, arr = [7,2,5,3,5,3].
 The original array of numbers brr = [7,2,5,4,6,3,5,3].  The numbers missing are [4.6].
 
 Numeros the Artistには、相互に並べ替えられた2つのリストがありました。 彼はとても誇りに思っていました。 残念ながら、ある展示から別の展示にそれらを輸送する間、最初のリストからいくつかの数字が失われました。 不足している番号を見つけることができますか？
     例として、いくつかの数値が欠落している配列、arr = [7,2,5,3,5,3]。
     数値の元の配列brr = [7,2,5,4,6,3,5,3]。 欠落している数字は[4.6]です。
 
 If a number occurs multiple times in the lists, you must ensure that the frequency of that number in both lists is the same. If that is not the case, then it is also a missing number.
 You have to print all the missing numbers in ascending order.
 Print each missing number once, even if it is missing multiple times.
 The difference between maximum and minimum number in the second list is less than or equal to 100.
 
 リストに数字が複数回出現する場合は、両方のリストでその数字の頻度が同じであることを確認する必要があります。 そうでない場合は、不足している数字でもあります。
 不足しているすべての番号を昇順で印刷する必要があります。
 複数回欠落している場合でも、欠落している各番号を1回印刷します。
 2番目のリストの最大数と最小数の差は100以下です。
 */

func findMissingNumbers(brr: [Int], arr: [Int]) {
    var cnt = 0
    var brrcntdic: [Int:Int] = [:]
    var arrcntdic: [Int:Int] = [:]
    let brrset = Set(brr)
    let arrset = Set(arr)
    
    for i in brrset {
        for j in brr {
            if i == j {
                cnt += 1
                brrcntdic.updateValue(cnt, forKey: i)
            }
        }
        cnt = 0
    }
    
    for k in arrset {
        for l in arr {
            if k == l {
                cnt += 1
                arrcntdic.updateValue(cnt, forKey: k)
            }
        }
        cnt = 0
    }
    
    for (brrkey, brrvalue) in brrcntdic.sorted(by: {$0 < $1}) {
        for (arrkey, arrvalue) in arrcntdic.sorted(by: {$0 < $1}) {
            if brrkey == arrkey {
                var difference = arrvalue - brrvalue
                if difference > 0 {
                    while difference > 0 {
                        print(brrkey, terminator: " ")
                        difference -= 1
                    }
                }
            }
        }
    }
    
}


findMissingNumbers(brr: [203,204,205,206,207,208,203,204,205,206], arr: [203,204,204,205,206,207,205,208,203,206,205,206,204])
