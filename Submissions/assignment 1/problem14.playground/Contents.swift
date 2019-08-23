import UIKit

func sortString (_ sorting:(String, String)->Bool, list: [String]) {
    let newList = list.sorted(by: sorting)
    print(newList)
}

func sortAsc (_ s1:String, _ s2:String) -> Bool {
    return s1 < s2
}

func sortDesc (_ s1:String, _ s2:String) -> Bool {
    return s1 > s2
}

let list = ["Shoko", "Shihomi", "Lucas", "Rose", "Henrique"];
sortString(sortDesc, list: list)
