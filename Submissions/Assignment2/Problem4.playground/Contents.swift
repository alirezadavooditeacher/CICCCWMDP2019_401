import UIKit

func sorter(words:[String]?, comparator: (String, String)->Bool) -> [String]?{
    guard let word = words else {
        return nil
    }
    let sortedWords = words?.sorted(by: comparator)
    return sortedWords
}

let list1 = ["one","two","three","four","five"]
let sortedByAsc = sorter(words: list1) { (str1:String, str2:String) -> Bool in return str1 < str2 }
print("sortedByAsc: \(sortedByAsc)")

let sortedByDesc = sorter(words: list1) { (str1:String, str2:String) -> Bool in return str1 > str2 }
print("sortedByDesc: \(sortedByDesc)")

let list2 = ["aa","aba","b","aabbb"]
let descBasedOnItemLength = sorter(words: list2) { (str1:String, str2:String) -> Bool in return str1.count > str2.count }
print("descBasedOnItemLength: \(descBasedOnItemLength)")

