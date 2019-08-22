import UIKit

func compareReversedString(_ string:String) -> (Int, String?)? {
    
    guard !string.isEmpty else {
        return nil
    }
    
    var reversedString = "";
    var result:(Int, String?);
    
    for letter in string.reversed() {
        reversedString.append(letter)
    }
    
    if reversedString.contains(string) {
        result = (1, nil)
    } else {
        result = (0, "Reversed version is not the same")
    }
    
    return result
}
if let (status, message) = compareReversedString("BaBa") {
    if status == 1 {
        print("The reversed version of this is string is the same as the original")
    } else if let mess = message {
        print(mess)
    }
} else {
    print("The string is empty")
}
