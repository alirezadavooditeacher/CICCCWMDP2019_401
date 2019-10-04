//: Playground - noun: a place where people can play

func exchangePositions<Element>(index1:Int, index2:Int, array:[Element]) -> [Element]{
    var result = array
    let temp = result[index1]
    result[index1] = result[index2]
    result[index2] = temp
    return result
}

print(exchangePositions(index1: 1, index2: 0, array: ["Rose", "Shoko", "Shihomi"]))

