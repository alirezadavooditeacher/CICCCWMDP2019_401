import UIKit

// Problem 13

func makeDictionary(words:[String]) -> [String: [String]]?{
    
    guard !words.isEmpty else {
        return nil
    }
    
    var listOfWords: [String: [String]] = [:]
    
    for word in words {
        let key = String(word.prefix(1)).uppercased()
        listOfWords[key, default: []].append(word)
    }
    
    let resultList = listOfWords.sorted() { $0.0<$1.0 }
    print(resultList)
    
    return listOfWords
}

makeDictionary(words: ["apple","Ali","Book","Cook"])
