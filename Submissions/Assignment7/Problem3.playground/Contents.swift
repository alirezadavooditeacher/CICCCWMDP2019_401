import UIKit

class Problem3<Element:Equatable> {
    var array:[Element]?
    
    func addItemToList(item:Element)->[Element]{
        var newList:[Element] = []
        if let items = array {
            newList = items
            newList.append(item)
        }
        return newList
    }
    
    func removeItemFromTheList(item:Element) -> [Element]? {
        
        if let index = array?.firstIndex(of:item) {
            array?.remove(at: index)
        }
        return array ?? nil
    }
    
    init(array:[Element]?) {
        self.array = array
    }
}

var problem3 = Problem3(array: ["AA","BB","CC","DD","EE"])
let newList = problem3.addItemToList(item: "KK")
print(newList)
let removedList = problem3.removeItemFromTheList(item: "AA")
print(removedList)
