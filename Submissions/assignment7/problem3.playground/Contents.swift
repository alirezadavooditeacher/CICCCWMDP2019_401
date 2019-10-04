//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

class problem3<Value> {
    
    var array:[Value?]
    
    init(array:[Value]) { self.array = array }
   
    func addItemToList(item:Value) -> [Value?] {
        array.append(item)
        let result = array
        return result
    }
    
    func removeItemFromTheList(itemIndex:Int) -> [Value?] {
        array.remove(at: itemIndex)
        let result = array
        return result
    }
}

let Problem3 = problem3(array: [100,22,44])
Problem3.addItemToList(item: 17)
Problem3.removeItemFromTheList(itemIndex: 0)
