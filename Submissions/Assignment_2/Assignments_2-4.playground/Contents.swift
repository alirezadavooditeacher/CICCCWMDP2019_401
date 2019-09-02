import UIKit
//problem2-4
func sorter(_ list:[String]?, criteria: (String, String)->Bool) -> [String]?{
    guard let words = list else {
        return nil
    }
    let sortedWords = words.sorted(by:criteria)
    return sortedWords
}

if let list1 = sorter(["one","two","three","four","five"],criteria: {(s1:String,s2: String)->Bool in
    s1 < s2
}){
    print("Alphabetically ascending:\(list1)")
}

if let list2 = sorter(["one","two","three","four","five"],criteria: {(s1:String,s2: String)->Bool in
    s1 > s2
}){
    print("Alphabetically descending:\(list2)")
}

if let list3 = sorter(["aa","aba","b","aabbb"],criteria: {(s1:String,s2: String)->Bool in
    s1.count > s2.count
}){
    print("Length descending:\(list3)")
}
