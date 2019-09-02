//problem3
func addNum(num:Int){
    var tempNum:Int = num
    var digit = 0
    var sum = 0
    while tempNum > 0 {
        digit = tempNum % 10
        tempNum = tempNum / 10
        sum += digit
    }
    print("sum of \(num):\(sum)")
}
addNum(num:568)
