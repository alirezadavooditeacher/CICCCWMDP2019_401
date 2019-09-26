import UIKit

class P3<T:Equatable>{
    var property:[T]
    init(){
        property = []
    }
    func addItemToList(Item:T)->[T]{
        property.append(Item)
        return property
    }
    func removeItemFromTheList(Item:T)->[T]{
        if property.contains(Item){
            property.remove(at: property.firstIndex(of: Item)!)
        }
        return property
    }
}


let p3 = P3<Int>()
p3.property = [2,4,6,7]
p3.addItemToList(Item: 5)
p3.removeItemFromTheList(Item: 7)

let t1 = P3<String>()
t1.property = ["w","r","3","f"]
t1.addItemToList(Item: "b")
t1.removeItemFromTheList(Item: "3")
