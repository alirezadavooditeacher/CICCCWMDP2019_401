import UIKit

// Problem 14
func sortString(sortFunc:(String,String)->Bool,listOfName:[String]){
    var sortList = listOfName.sorted(by: sortFunc)
    print(sortList)
}

func sortAsc (str1:String, str2:String) -> Bool {
    return str1 < str2
}

func sortDesc (str1:String, str2:String) -> Bool {
    return str1 > str2
}

sortString(sortFunc: sortAsc, listOfName: ["Apple","Ali","Book","Cook","Alice"])
