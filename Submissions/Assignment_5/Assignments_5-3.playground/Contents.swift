import UIKit

extension String{
    func isPalindrome()->Bool{
        var newString = ""
        for value in self{
            newString.insert(value, at: newString.startIndex)
        }
        if newString == self{
            return true
        }else{
            return false
        }
    }
    func inverse()->String{
        var newString = ""
        for value in self{
            newString.insert(value, at: newString.startIndex)
        }
        return newString
    }
}
"ertre".isPalindrome()
"tuye".isPalindrome()
"oiyte".inverse()

extension String{
    var num:Int{
        return self.count
    }
    var uppercae:String{
        return self.uppercased()
    }
}



"dfghh".num
"rtyu".uppercased()

