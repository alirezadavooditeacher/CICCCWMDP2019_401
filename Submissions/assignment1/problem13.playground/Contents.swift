import UIKit

/*
 Write a function which receives a list of English words as its input. The function will
 return and print the list of all distinct words starts with English alphabets. Like:
 A: Ali, apple, ... B: Bob, book
 ...
 Z: []
 If the input list is empty the function will return nil.
*/

func makeDictionary(_ words: [String]) {
    var dic = [String: [String]]()
    for i in words {
//        print(i.prefix(1),i)
        
        if dic[String(i.prefix(1))] != nil { // i.prefix(1) is the first character of the word
            dic[String(i.prefix(1))]?.append(i)
        } else {
            dic[String(i.prefix(1))] = []
            dic[String(i.prefix(1))]?.append(i)
        }

    }
    
    for item in dic.keys.sorted().enumerated() {
        print("\(item.element):\(dic[item.element]!)" )
    }
    
}

var words1 = ["Apple","Book","TV","Computer","Alisan","Chair","Banana","Beer","Steamworks","Steak","Ramen","KEG","Car","Amazon","PSYCHO-PASS","Microsoft","Phone","CICCC","Protein","Gym","Job","Money"]

makeDictionary(words1)
