import UIKit

class SomeClass<Element> {
    var list: [Element]?
    
    func addItemToList(item: Element) -> [Element]? {
        if list != nil {
            list!.append(item)
            return list
        }
        return nil
    }
    
    func removeItemFromList(index: Int, list: inout [Element]) -> Element {
        let removedItem = list[index]
        list.remove(at: index)
        return removedItem
    }
    
    init(list: [Element]?) {
        self.list = list
    }
}

var test = SomeClass<String>(list: [])

test.addItemToList(item: "Hello")
print(test.list!)

test.removeItemFromList(index: 0, list: &test.list!)
print(test.list!)
