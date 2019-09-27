import UIKit

/* Problem3
 Write a generic class with the following three methods and properties:
 • A property which is generic array which is optional
 • An instance method clled, addItemToList: add a generic object to the list and returns the
 new list.
 • An instance method called, removeItemFromTheList: remove a generic object from the
 list and returns the removed item.
 */

class GenericClass<Element>{
    var arr = [Element]()
    func addItemToList(_ obj: Element) -> [Element]{
        arr.append(obj)
        return arr
    }
    func removeItemFromTheList(_ obj: Element) -> Element{
        return arr.removeLast()
    }
}

var genericClass = GenericClass<String>()
genericClass.addItemToList("cat")
genericClass.addItemToList("dog")
genericClass.addItemToList("bird")
genericClass.addItemToList("human")
print("\(genericClass.arr)\n")

print("remove \(genericClass.removeItemFromTheList("human")) in arr")
print(genericClass.arr)

