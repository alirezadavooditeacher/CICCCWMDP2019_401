//problem4

func divisible(_ divisibleNum:String,_ numA: inout Int,_ numB: inout Int){

    func divisible3n5(_ numA:inout Int,_ numB:inout Int){
        if numA > numB{
            let tempA = numA
            numA = numB
            numB = tempA
        }
        for num in numA+1..<numB{
            if num % (3*5) == 0{
                print(num)
            }
        }
    }

    func divisible6or7(_ numA:inout Int,_ numB:inout Int){
        if numA > numB{
            let tempA = numA
            numA = numB+1   //not include B
            numB = tempA+1 //include A
        }
        for num in numA..<numB{
            if num % 6 == 0 || num % 7 == 0{
                print(num)
            }
        }
    }

    func notDivisible3(_ numA:inout Int,_ numB:inout Int){
        if numA > numB{
            let tempA = numA
            numA = numB
            numB = tempA
        }
        for num in numA...numB{
            if num % 3 != 0{
                print(num)
            }
        }
    }
    
    switch divisibleNum{
    case "divisible3n5":
        divisible3n5(&numA,&numB)
    case "divisible6or7":
        divisible6or7(&numA,&numB)
    case "notDivisible3":
        notDivisible3(&numA,&numB)
    default:
        print("It is a wrong enter.")
        
    }
}

var A = 42
var B = 6
divisible("divisible3n5",&A,&B)
print()
divisible("divisible6or7",&A,&B)
print()
divisible("notDivisible3",&A,&B)

