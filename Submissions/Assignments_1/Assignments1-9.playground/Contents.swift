//problem9
func removeNum(num:Int,List:[Int]) -> [Int]{
    var list = List
    for value in list{
        if num == value{
            if let index = list.firstIndex(of: value){
                list.remove(at:index)
            }
        }
    }
    return list
}

let removeNum = 5
let OldList = [2,5,47,8,4,3,9,5]

let NewList = removeNum(num: removeNum, List:OldList)
print("Remove \(removeNum) in old list \(OldList)")
print("New list: \(NewList)")
