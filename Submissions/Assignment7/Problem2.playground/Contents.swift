import UIKit

func exchangePosition<T>(index1: inout Int, index2: inout Int, array: inout [T]) {
    let tempA = array[index1]
    array[index1] = array[index2]
    array[index2] = tempA
}

var stringArray = ["Hello", "!", "World"]

var indexToExchange = 1
var indexBeingExchangeWith = 2

exchangePosition(index1: &indexToExchange, index2: &indexBeingExchangeWith, array: &stringArray)
print(stringArray)
