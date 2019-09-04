func PrintShape(input:Int ,format:String){
    var star =  input
    var space = 0
    
    func shape1(_ input:Int){
        while star > 0{
            if space > 0{
                for _ in 1...space{
                    print(" ",terminator:"")
                }
            }
            for _ in 1...star {
                print("*",terminator:"")
            }
            star -= 2
            space += 1
            print("")
        }
    }
    
    func shape2(_ input:Int){
        while star > 0{
            for _ in 1...star {
                print("*",terminator:"")
            }
            star -= 1
            print("")
        }
    }
    
    func shape3(_ input:Int){
        star = 0
        while star < input{
            for _ in 0...star{
                print("*",terminator:"")
            }
            star += 1
            print("")
        }
    }
    
    switch format{
    case "shape1":
        shape1(input)
    case "shape2":
        shape2(input)
    case "shape3":
        shape3(input)
    default: print("It is a wrong format.")
    }
}
PrintShape(input:5,format:"shape1")
print()
PrintShape(input:5,format:"shape2")
print()
PrintShape(input:5,format:"shape3")

