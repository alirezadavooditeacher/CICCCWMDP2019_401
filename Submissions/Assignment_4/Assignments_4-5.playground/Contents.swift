import UIKit
//
func palindrome(str:String){
    if palinCheck(str:str) == true{
        print(-1)
    }
    else{
        var count = -1
        var temp = str
        for char in temp{
            let index = temp.firstIndex(of: char)
            temp.remove(at: index!)
            count += 1
            if palinCheck(str: temp) == true{
                print(count)
            }
            temp = str
        }
    }
}

func palinCheck(str:String)-> Bool{
    var inv_str:String = ""
    for char in str{
        inv_str.insert(char, at: inv_str.startIndex)
    }
     if inv_str == str{ return true}
     else{return false}
}

palindrome(str:"addd")
palindrome(str:"weewq")
palindrome(str:"qrqq")
palindrome(str:"ccc")



