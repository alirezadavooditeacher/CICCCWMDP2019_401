import UIKit

func sorter(words:[String],comparator:(String,String)->Bool) -> [String]? {
    guard !words.isEmpty else {
        return nil
    }
    let sortedWords = words.sorted(by: comparator)
    return sortedWords
}

var words = ["one", "two", "three", "four", "five"]
let sortedAsc = sorter(words: words) { (_ s1:String, _ s2:String) -> Bool in return s1 < s2 }!
print(sortedAsc)
let sortedDesc = sorter(words: words) { (_ s1:String, _ s2:String) -> Bool in return s1 > s2 }!
print(sortedDesc)
words = ["aa", "aba", "bb", "aabbb"]
let sortedLength = sorter(words: words) { (_ s1:String, _ s2:String) -> Bool in return s1.count > s2.count }!
print(sortedLength)
