//problem7
func checkReverse(text: String) -> Bool?{
    var str = ""
    if text != nil{
        for value in text{
            str = "\(value)" + str
        }
        if str == text{
            return true
        }else{
            return false
        }
    }else{
        return nil
    }
}
let input = "CommoC"
print("\(input):\(checkReverse(text:input)!)")
