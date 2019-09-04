//problem14

func sortString(_ array:[String],_ type:String)->(Bool,[String]?){
    
    switch type{
        case "ascending":
             return (true , array.sorted(by:<))
        case "descending":
            return (true , array.sorted(by:>))
        default:
            print("Wrong type!")
            return (false , nil)
    }
    
}
sortString(["Henry","Shoko","Yesl","Shihomi","Lucas"],"ascending")
sortString(["Henry","Shoko","Yesl","Shihomi","Lucas"],"descending")
