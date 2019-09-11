import Cocoa

var str = "Hello, playground"

func isPalinedrome(s:String) -> Bool {
    let reverse = String(s.reversed())
    if s == reverse { return true }
    else { return false }
}


struct createPalinedrome{

    
   
    static func deleteCharactor(s:String) -> Int{
        let array = s
       
        // check if it is plinedrome or not at first
        // remove each one elements and check if it is palinedrome or not
        
        if isPalinedrome(s: array){
            print(-1)
            return -1
        }
        
        var createdString = ""
        var removedIndex:Int? = nil
        
        for (index, value) in array.enumerated(){
            
            if removedIndex == nil && value != array[array.index(array.startIndex, offsetBy: index)]{
                removedIndex = index
            } else {
                createdString.append(value)
            }
        }
        
        if isPalinedrome(s: createdString){
            print(removedIndex!)
            return removedIndex!
        } else {
            print(-1)
            return -1
        }
        }
    
    }
    



var a = "baabc"
createPalinedrome.deleteCharactor(s:a)
