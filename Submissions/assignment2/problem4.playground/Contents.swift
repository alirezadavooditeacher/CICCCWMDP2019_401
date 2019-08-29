import UIKit

/* Problem 4: Sorted()------------------------------------------------------------
 Write a function called sorter which receives two inputs parameters:
 1- A list of String called words
 2- A function type of type (String,String)->Bool called comparator
 
 And returns a list of String
 The function sorter, then will sort the list (array) of String using the criteria defined by the comparator parameter.
 
 func sorter(_ list:[String]?, criteria by: (String, String) -> Bool) -> String]?{
 guard let words = list else {
 return nil
 }
 sortedWords = words.sorter(criteria)
 return sortedWords
 }
 
 Now call the sorter function defined above for the following list and criteria:
 
 
 1- List: [“one”, “two”, “three”, “four”, “five”] Criteria: Alphabetically Ascendingly
 アルファベット順に昇順
 
 2- List: [“one”, “two”, “three”, “four”, “five”] Criteria: Alphabetically Descending
 アルファベット順に降順
 
 3- List: [“aa”, “aba”, “b”, “aabbb”] Criteria: Descending based on the length of the items
 アイテムの長さに基づいた降順
 
 */

func sorter(_ words:[String], _ comparator: (String, String) -> Bool) -> [String]?{
    guard !words.isEmpty else {
        return nil
    }
    let sortedWords = words.sorted(by: comparator)
    return sortedWords
}

// list1: Criteria: Alphabetically Ascendingly アルファベット順に昇順
let words1 = ["one","two","three","four","five"]
let ansOf1 = sorter(words1) { $0 < $1 }!
print(ansOf1)
// list2: Criteria: Criteria: Alphabetically Descending アルファベット順に降順
let words2 = ["one", "two", "three", "four", "five"]
let ansOf2 = sorter(words2) { $1 < $0 }!
print(ansOf2)
// listw: Criteria: Descending based on the length of the items アイテムの長さに基づいた降順
let words3 = ["aa", "aba", "b", "aabbb"]
let ansOf3 = sorter(words3) { $1.count > $0.count }!
print(ansOf3)
