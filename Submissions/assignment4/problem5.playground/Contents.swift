import UIKit

/* Problem5: HackerRank / Missing Number
 Solve the Palindrome problem (you did in the class) is Swift.
 https:www.hackerrank.com/challenges/palindrome-index/problem
 
 Given a string of lowercase letters in the range ascii[a-z], determine a character that can be removed to make the string a palindrome. There may be more than one solution, but any will do. For example, if your string is "bcbc", you can either remove 'b' at index 0 or 'c' at index 3. If the word is already a palindrome or there is no solution, return -1. Otherwise, return the index of a character to remove.
 
 ascii [a-z]の範囲の小文字の文字列が与えられたら、文字列を回文にするために削除できる文字を決定します。 複数のソリューションが存在する場合がありますが、いずれも解決します。 たとえば、文字列が「bcbc」の場合、インデックス0の「b」またはインデックス3の「c」を削除できます。単語がすでに回文であるか、解決策がない場合は、-1を返します。 それ以外の場合は、削除する文字のインデックスを返します。
 */

func palindromeIndex (_ s: String) -> Int {
    let r = String(s.reversed())
    var slist = [String]()
    var rlist = [String]()
    var cnt1 = 0
    var cnt2 = 0
    var cnt3 = 0
    var anslist = [String]()
    
    if s == r {
        return -1
    } else {
        for i in s {
            slist.append(String(i))
        }
        for j in r {
            rlist.append(String(j))
        }
        for _ in slist {
            for _ in rlist {
                if cnt1 < slist.count - 1 {
                    let temp = slist[cnt1] + slist[cnt1 + 1]
                    if cnt2 < rlist.count - 1 {
                        if temp == rlist[cnt2] + rlist[cnt2 + 1] {
                            print(slist[cnt1], terminator: "")
                            cnt1 += 1
                            cnt2 += 1
                            cnt3 += 1
                        } else {
                            cnt2 += 1
                            if cnt3 > 0 {
                                print(slist[cnt1], terminator: "")
                            }
                        }
                    }
                }
            }
            if cnt3 == 0 {
                cnt2 = 0
                anslist.append(String(cnt1))
            }
            cnt1 += 1
        }
        if slist[slist.count - 1] == rlist[rlist.count - 2] {
            print(slist[slist.count - 1])
        }
        
        
        if let ans = Int(anslist.joined()) {
            print("\nThe indexs of characters to remove")
            for k in String(ans) {
                print(k, terminator: " ")
            }
            return ans
        } else {
            return -1
        }
    }
}

var word = "banana"
//          ananab
print("\(word) ➡︎ ", terminator: "")
palindromeIndex(word)
