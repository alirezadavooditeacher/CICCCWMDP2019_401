import UIKit

class MyClass<Element: Equatable> {
    var arr: [Element]?
    func addItemToList (_ item: Element) -> [Element] {
        if self.arr == nil {
            self.arr = []
        }
        self.arr!.append(item)
        return self.arr!
    }
    func removeItemFromTheList(_ item: Element) -> Element? {
        guard var arr = self.arr else {
            return nil
        }
        
        if arr.contains(item) {
            arr = arr.filter {$0 != item}
            return item
        }
        return nil
    }
}

var myClass = MyClass<String>()
myClass.addItemToList("Hello")
myClass.addItemToList(" ")
myClass.addItemToList("World")
print(myClass.arr)
let removed = myClass.removeItemFromTheList(" ")
print(removed)
