import UIKit

/*
 Write a swift function called sortString which takes a function type of type (String, String)-> Boolean and also an array of String. The function will sort the array of String using the input FunctionType. Call this function 2 times: 1) to sort a list of String from ascendingly and 2) to sort the list of Strings descending.
 
 type（String、String）-> Booleanの関数型とStringの配列を受け取るsortStringと呼ばれる迅速な関数を記述します。 関数は、入力FunctionTypeを使用して文字列の配列をソートします。 この関数を2回呼び出します。1）ストリングのリストを昇順でソートするため、2）ストリングのリストを降順でソートするため。
 
*/


//func sortString (_ words: (String, String) -> Bool, _ wordslist: [String]) -> [String] {
//
//}


func sortString (_ sort: Int, _ wordslist: [String]) {
    
    guard sort == 1 else {
        let afterSort1 = wordslist.sorted() { $1 < $0 }
        print(afterSort1)
        return
    }
    
    guard sort == 2 else {
        let afterSort2 = wordslist.sorted() { $0 < $1 }
        print(afterSort2)
        return
    }

}

sortString(1, ["V","W","C","A","D","B","G","E","F","K","H","J","I","N","L","M","R","P","O","U","T","S","Q","Z","Y","X"])
sortString(2, ["V","W","C","A","D","B","G","E","F","K","H","J","I","N","L","M","R","P","O","U","T","S","Q","Z","Y","X"])
