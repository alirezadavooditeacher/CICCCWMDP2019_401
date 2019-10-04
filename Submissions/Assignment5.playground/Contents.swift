//: A UIKit based Playground for presenting user interface
  
import UIKit

// Problem 1: Shape and Inherited Computed Properties
class Shape {
    var area: Double {
        return 0
    }
    var circumference: Double {
        return 0
    }
}


class Rectangle: Shape {
    var height = 0.0
    var width = 0.0

    func receiveNum(_ height: Double, _ width: Double) {
        self.height = height
        self.width = width
    }

    override var area: Double {
        return height * width
    }

    override var circumference: Double {
        return (height + height) * 2
    }

}


class Square: Shape {
    var oneSide = 0.0

    func receiveNum(_ oneSide: Double) {
        self.oneSide = oneSide
    }

    override var area: Double {
        return oneSide * oneSide
    }

    override var circumference: Double {
        return oneSide * 4
    }
}


class Circle: Shape {
    var radius = 0.0

    func receiveNum(_ radius: Double) {
        self.radius = radius
    }

    override var area: Double {
        return radius * radius * 3.14
    }

    override var circumference: Double {
        return (radius * 2) * 3.14
    }
}


let rectangle1 = Rectangle()
rectangle1.receiveNum(4, 8)
print("rectangle1\narea: \(rectangle1.area)  circumference: \(rectangle1.circumference)\n")

let square1 = Square()
square1.receiveNum(5)
print("square1\narea: \(square1.area)  circumference: \(square1.circumference)\n")

let circle1 = Circle()
circle1.receiveNum(3)
print("circle1\narea: \(circle1.area)  circumference: \(circle1.circumference)\n")

---------------------------------------------

import UIKit

//Problem 2: Inheritance

class Product {
    var productID = 0
    var productName = ""
    var productPrice = 0.0
    var productMadeInCountry = ""

    init (productID: Int, productName: String, productPrice: Double, productMadeInCountry: String) {
        self.productID = productID
        self.productName = productName
        self.productPrice = productPrice
        self.productMadeInCountry = productMadeInCountry
    }
}
let product1 = Product(productID: 110, productName: "Diet Pepsi", productPrice: 2, productMadeInCountry: "USA")




class Drink: Product {
    var isDrinkDiet = false
    var drinkSize = 0

    init (productID: Int, productName: String, productPrice: Double, productMadeInCountry: String, isDrinkDiet: Bool, drinkSize: Int) {
        self.isDrinkDiet = isDrinkDiet
        self.drinkSize = drinkSize
        super.init(productID: productID, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry)
    }
}

class Food: Product {
    var foodCalorie = 0
    var foodSize = 0
    var foodIngredients = [String]()

    init (productID: Int, productName: String, productPrice: Double, productMadeInCountry: String, foodCalorie: Int, foodSize: Int, foodIngredients: [String]) {
        self.foodCalorie = foodCalorie
        self.foodSize = foodSize
        self.foodIngredients = foodIngredients
        super.init(productID: productID, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry)
    }
}

class Cloth: Product {
    var clothMaterials = [Material]()

    init (productID: Int, productName: String, productPrice: Double, productMadeInCountry: String, clothMaterials: [Material]) {
        self.clothMaterials = clothMaterials
        super.init(productID: productID, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry)
    }
}

class Material: Product {

    init (materialCode: Int, materialName: String) {
        super.init(productID: materialCode, productName: materialName, productPrice: 0, productMadeInCountry: "")
    }
}


class ShoppingCart {
    var items = [Product]()
    var sum = 0

    func addItems(_ items: [Product] ) {
        self.items = items
    }

    func calculateSum() -> Int {
        for item in self.items {
            self.sum += Int(item.productPrice)
        }
        return self.sum
    }

    func printNameOfItems() {
        print("The list of the Items")
        for item in self.items {
            print("Name:\(item.productName)")
        }
    }
}



// amount 3
let drink1 = Drink(productID: 412, productName: "Pepsi", productPrice: 2, productMadeInCountry: "USA", isDrinkDiet: false, drinkSize: 150)

// amount 1
let drink2 = Drink(productID: 183, productName: "Ginger Zero", productPrice: 3, productMadeInCountry: "Canada", isDrinkDiet: true, drinkSize: 200)

// amount 2
let food1 = Food(productID: 100, productName: "Chicken", productPrice: 8, productMadeInCountry: "Canada", foodCalorie: 350, foodSize: 4, foodIngredients: ["chicken","oil","chees"])

// amount 2
let food2 = Food(productID: 101, productName: "Pasta", productPrice: 18, productMadeInCountry: "Canada", foodCalorie: 250, foodSize: 3, foodIngredients: ["pasta","meet","spinach"])

// amount 1
let cloth1 = Cloth(productID: 701, productName: "T-shirt", productPrice: 15, productMadeInCountry: "China", clothMaterials: [Material(materialCode: 10, materialName: "cotton"), Material(materialCode: 11, materialName: "nylon")])

var items = [drink1, drink1, drink1, drink2, food1, food1, food2, food2, cloth1]

let shoppingCart = ShoppingCart()
shoppingCart.addItems(items)
print("The total price is $\(shoppingCart.calculateSum())\n")
shoppingCart.printNameOfItems()

-------------------------------------------------------------------------------

import UIKit
//Problem 3: Extensions

extension String {
    func reverseInt() -> String {
        return String(self.reversed())
    }

    func isPalindrome() -> Bool {
        if self == reverseInt() {
            return true
        } else {
            return false
        }
    }

}

extension String {
    var length: Int {
        return self.count
    }

    var uppercaseL: String {
        return self.uppercased()
    }
}

let word = "banana"
let r = word.reverseInt()
print("\(word)\npalindrome? \(word.isPalindrome())\nlength: \(word.length)\nuppercase letter: \(word.uppercaseL)")
