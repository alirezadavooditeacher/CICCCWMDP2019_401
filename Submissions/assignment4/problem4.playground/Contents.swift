import UIKit

/* Problem4: Function Type as computed property
 Define a class call MySort. The class has the following:
 • A stored property called items which is an array of integer
 • A read-only computed property called sorting with type ([int])->Void
 
 Define a class called MyBubbleSort to be the child of MySort class.
 Define a class called MyInsertionSort to be the child of MySort class.
 
 Both child classes will override the sorting computed property such that the MyBubbleSort class implements the BubbleSort algorithm and the MyInsertionSort will implement the InsertionSort.
 両方の子クラスは、MyBubbleSortクラスがBubbleSortアルゴリズムを実装し、MyInsertionSortがInsertionSortを実装するように、ソート計算プロパティをオーバーライドします。
 
 Then define one instance from each of MyBubbleSort and MyInsertionSort and assign them an arbitrary array of integer. Then use their sorting computed properties to sort the arrays and print the results.
 次に、MyBubbleSortとMyInsertionSortのそれぞれから1つのインスタンスを定義し、整数の任意の配列を割り当てます。 次に、それらのソート計算プロパティを使用して配列をソートし、結果を出力します。
 Bubble Sort: http:cs-study.blogspot.ca/2012/12/bubble-sort.html
 Insertion Sort: http:cs-study.blogspot.ca/2012/12/insertion-sort.html
 */

class MySort {
    var items = [Int]()
    var sorthing: Void {
        print(items)
    }
}

class MyBubbleSort {
    var items = [Int]()
    var sorthing: Void {
        for _ in 0..<items.count {
            for j in 1..<items.count {
                if items[j] < items[j-1] {
                    let temp = items[j-1]
                    items[j-1] = items[j]
                    items[j] = temp
                }
            }
        }
        print(items)
    }
}

class MyInsertionSort {
    var items = [Int]()
    var sorthing: Void {
        for i in 1..<items.count {
            let value = items[i]
            var position = i
            
            while position > 0 && items[position - 1] > value {
                items[position] = items[position - 1]
                position -= 1
            }
            
            items[position] = value
        }
        print(items)
    }
}

var bubbleSort = MyBubbleSort()
bubbleSort.items = [2,1,6,5,3,4]
bubbleSort.sorthing

var insertionSort = MyInsertionSort()
insertionSort.items = [10,7,9,12,8,13]
insertionSort.sorthing
