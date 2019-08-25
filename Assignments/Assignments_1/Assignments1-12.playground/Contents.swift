//version1
func removeRepeat(_ list:Int...) -> [Int]{
    
    var list2:[Int] = []
    for value in list{
        if list2.contains(value) == false{
            list2.append(value)
        }
    }
    return list2
}
print("list:[1,2,3,1,2,4,5]")
print("Remove version1:\(removeRepeat(1,2,3,1,2,4,5))")
 
//version2
func remove2(_ list:[Int])->[Int]{
    var count:[Int] = []
    var list2 = list

    for _ in 0..<list.count{
        count.append(0)
    }
    
    for i in 0..<list.count{
        for k in 0..<list.count{
            if list2[i] == list2[k]{
                count[i] += 1
            }
        }
    }
    
    for value in count{
        if value > 1 {
            if let index = count.firstIndex(of: value){
                list2.remove(at: index)
                count.remove(at: index)
            }
        }
    }
    return list2
}
print("Remove version2:\(remove2([1,2,3,1,2,4,5]))")
