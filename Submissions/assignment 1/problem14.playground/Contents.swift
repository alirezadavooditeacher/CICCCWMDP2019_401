import UIKit

func sortString (_ sorting:(String, String)->Bool, list: [String]) {
    let newList = list.sorted(by: sorting)
    print(newList)
}

func sortAsc (_ s1:String, _ s2:String) -> Bool {
    if s1 < s2 {
        return true
    } else {
        return false
    }
}

func sortDesc (_ s1:String, _ s2:String) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}

let list = ["Shoko", "Shihomi", "Lucas", "Rose", "Henrique"];
sortString(sortAsc, list: list)
