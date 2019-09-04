//problem11
func repeatNum(list:[Int]) -> (repeatNum:Int,times:Int){
    var times:[Int] = []
    var repeatNum:[Int] = []
    let count = list.count-1
    
    for _ in 0..<list.count{
        times.append(1)
        repeatNum.append(0)
    }

    for i in 0..<count{
        for k in 0..<count{
            if list[i] == list[k+1]{
                times[i] += 1
                (repeatNum[i],times[i]) = (list[i],times[i])
            }
        }
    }

    if let maxTimes = times.max(){
        let indexOfRepeat = times.firstIndex(of: maxTimes)
        return(list[indexOfRepeat!],maxTimes)
    }else{
        return(0,0)
    }
}
let input = [2,1,6,2,3,2]
print("list:\(input),\n\(repeatNum(list:input))")
