//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let word:[String]

var list = ["One", "Two", "Three", "Four"]
var length = ["aa", "aba", "b", "aabbb"]


func ascend(word1 a:String, word2 b:String) -> Bool{
    return a < b
}

func descend(word1 a:String, word2 b:String) -> Bool {
    return a > b
}

func length(word1 a:String, word2 b:String) -> Bool {
    return a.count > b.count
}

func sorter(_ list:[String]?, criteria by:(String, String) -> Bool) -> [String]?{
    guard let word = list else {
        return nil
    }
    var sortedWords = list!.sorted(by:by)
    return sortedWords
    
}

//print(sorter(list, criteria: ascend(word1:word2:))!)
print(sorter(list, criteria: descend(word1:word2:)))
print(sorter(length, criteria: length))
