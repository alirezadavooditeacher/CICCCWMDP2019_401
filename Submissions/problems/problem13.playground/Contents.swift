//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



func wordList(word a:[String]) -> [String:String]? {
    
    // in function prameter is array and return the dictionary
    // variable stored first charactor
    // in if statement, stored the value in the dictionary
    // in else statement, created the key in the dictionary
    
    let first = a.prefix(1)
    var dictionary = [String:String]()
    
    if a.isEmpty{
        return nil
    }
    else {
        for valueA in a {
            // if key exist already put value in the list
            if dictionary.keys  {
                dictionary[first] != nil {
                    var key:[String] = dictionary[first]!
                    key.append(contentsOf: valueA)
                
            // if not create key
            } else {
               dictionary.updateValue(valueA, forKey: first)
            }]
        }
    }
    
   
    
//    else {
//        return nil
//    }

    print()
}

wordList(word: ["henrique","shoko","lucas","rose","shihomi"])

