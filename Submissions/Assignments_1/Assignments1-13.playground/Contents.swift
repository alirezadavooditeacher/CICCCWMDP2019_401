//problem13
func word(_ list:[String]){
    
    let letter = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"
    ,"Q","R","S","T","U","V","W","X","Y","Z"]
    var dic = [String : [String]]()

    for alph in letter {
        dic[alph] = []
        let elements = list.filter({$0.hasPrefix(alph)}) //code is from internet
        if !elements.isEmpty{
            for value in elements{
                dic[alph]?.append(value)
            }
        }
    }
    let dicSort = dic.keys.sorted()
    for key in dicSort{
        print("\(key):\(dic[key]!)")
    }
}
word( ["Apple", "Banana", "Blueberry", "Eggplant"])

