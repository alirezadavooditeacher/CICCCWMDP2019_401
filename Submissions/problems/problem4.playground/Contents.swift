//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func div3and5(num1:Int, num2:Int) {
    for var answer:Int in num1...num2 {
        if answer % 3 == 0 && answer % 5 == 0 {
            print(answer)
            answer += 1
        }
    }
}

print("the number which are divided into both 3 and 5")
div3and5(num1: 1, num2: 30)

func div6or7(num1:Int, num2:Int) {
    for var answer:Int in num1...num2 {
        if answer % 6 == 0 || answer % 7 == 0 {
            print(answer)
            answer += 1
        }
    }
}

print("the number which are divided into either 6 or 7")
div6or7(num1: 1, num2: 100)

func divNot3(num1:Int, num2:Int) {
    for var answer:Int in num1...num2 {
        if answer % 3 != 0 {
            print(answer)
            answer += 1
        }
    }
}

print("the number which can't be divided into...")
divNot3(num1: 1, num2: 50)
