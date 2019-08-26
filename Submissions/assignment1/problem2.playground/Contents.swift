import UIKit

/* Problem2
 Design a function for an application which receive a number and a shape format (which
 is a string either “SHAPE1” or “SHAPE2” or “SHAPE3”) and prints a shape like this: (if
 the input is 5)
 - Example: input: 5 format: SHAPE1
 *****
  ***
   *
 - Example: input: 5 format: SHAPE2
 *****
 ****
 ***
 **
 *
 - Example: input: 5 format: SHAPE3
 *
 **
 ***
 ****
 *****
 - For the function above do not use any argument label (use the _ symbol to call the function)
 - Notice that this function has no return type.
 */


func makeShape (_ num: Int, _ shape: Int) {
    var cnt1 = 0
    var cnt2 = num
    var cnt3 = 0
    // Shape1
    if (shape == 1){
        while (cnt1 <= num) {
            if !(cnt3 == 0) {
                for _ in 1...cnt3 {
                    print(" ", terminator: "")
                }
            }
            for _ in 1...cnt2 {
                print("*", terminator: "")
            }
            print("")
            cnt1 = cnt1 + 2
            cnt2 = cnt2 - 2
            cnt3 = cnt3 + 1
            if (cnt2 == 0) {
                break
            }
        }
    }
    
    // Shape2
    else if (shape == 2){
        while (cnt2 > 0) {
            for _ in 1...cnt2 {
                print("*", terminator: "")
            }
            print("")
            cnt1 = cnt1 + 1
            cnt2 = cnt2 - 1
        }
    }
    
    // Shape3
    else if (shape == 3){
        while (cnt2 > 0) {
            cnt1 = cnt1 + 1
            for _ in 1...cnt1 {
                print("*", terminator: "")
            }
            print("")
            cnt2 = cnt2 - 1
        }
    }
    print("")
}

print("Shape1")
makeShape(5,1)
print("Shape2")
makeShape(5,2)
print("Shape3")
makeShape(5,3)



