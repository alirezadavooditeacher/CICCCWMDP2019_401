import UIKit

// Problem 7
func checkReverseWords(_ input: String) -> (Int?,String?){
    var reversWord = ""
    var errCode: Int?
    var errMessage: String?
    if input != "" {
        for str in input.reversed(){
            reversWord += String(str)
        }
        
        if input == reversWord {
            errCode = 1
        } else {
            errCode = 0
            errMessage = "The word is not same as revers world"
        }
    }
    return (errCode, errMessage)
}
let r = checkReverseWords("BaBa")
print(r)
