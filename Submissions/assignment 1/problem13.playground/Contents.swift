import UIKit

func reorderDictionary(list:[String]) -> [String: [String]]? {
    
    guard !list.isEmpty else {
        return nil
    }
    
    let distictWords = [String](Set<String>(list))
    var dictionary = [String:[String]]()
    var firstLetter:String
    
    for word in distictWords {
        firstLetter = word[word.startIndex].uppercased()
        if var words = dictionary[firstLetter] {
            words.append(word)
            if let _ = dictionary.updateValue(words.sorted(by: <), forKey: firstLetter) {}
        } else {
            if let _ = dictionary.updateValue([word], forKey: firstLetter) {}
        }
    }
    
    dictionary.keys.sorted

    print(dictionary)
    return dictionary
    
}
let unorderedList = [
    "Bicible", "Ball", "Bar",
    "August", "Academic", "Armor", "Academic"
]
reorderDictionary(list: unorderedList)
