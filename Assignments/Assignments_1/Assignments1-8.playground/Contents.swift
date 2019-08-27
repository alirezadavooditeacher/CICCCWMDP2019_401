//problem8 variadic
func variadic(num: Int,List:Int...){
    
    for value in List{
        if num == value{
            print("\(num) belongs to list\(List).")
            break
        }
        else if value == List.last{
            print("\(num) not belongs to list:\(List).")
        }
    }
}

variadic(num:5,List:2,4,66,5,7)
