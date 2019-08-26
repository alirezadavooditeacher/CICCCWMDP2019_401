import UIKit

/*
 Write a function which receives a string as input and does the following:
 - Check whether the input string and the its reverse is the same (like BaBa), if yes it return 1 and if false, it returns 0 with a proper message. It considers case-sensitivity which means (Baba and BaBa are not the same)
 - If the input string is empty, the function should return nil.
*/

func reverseAndCheck (_ str1: String) -> Int {
    var list1 = [Character]()
    var list2 = [Character]()
    for character1 in str1 {
        list1.append(character1)
        list2.insert(character1, at: 0)
    }
    if (String(list1) == String(list2)) {
        print("same")
        print(String(list1))
        print(String(list2))
        print("")
        return 1
    } else {
        print("not same")
        print(String(list1))
        print(String(list2))
        print("")
        return 0
    }
}

reverseAndCheck("Alisan")
reverseAndCheck("AbAbA")
