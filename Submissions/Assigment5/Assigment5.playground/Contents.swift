import UIKit

//Problem 1

class Shape {
    var area: Double {
        return 0
    }
    
    var circumference: Double {
        return 0
    }
}

class Rectangle: Shape {
    var length: Double = 20
    var width: Double = 10
    override var area: Double {
        return width * length
    }
}

class Circle: Shape {
    static var PI = 3.14
    var radius: Double = 50
    var diameter: Double = 4
    override var area: Double {
        return Circle.PI * radius * radius
    }
    
    override var circumference: Double {
        return Circle.PI * diameter
    }
    
}

class Square: Shape {
    var side: Double = 10
    override var area: Double {
        return side * side
    }
}

let rectangle = Rectangle()
print(rectangle.area)

let circle = Circle()
print(circle.area)
print(circle.circumference)

let square = Square()
print(square.area)

//Problem 2

class Product {
    let productID: Int
    var productName: String
    var productPrice: Double
    let productMadeInCountry: String
    let size: Int
    
    init(productID: Int, productName: String, productPrice: Double, productMadeInCountry: String, size: Int) {
        self.productID = productID
        self.productName = productName
        self.productPrice = productPrice
        self.productMadeInCountry = productMadeInCountry
        self.size = size
    }
}

class Drink: Product {
    let isDrinkDiet: Bool
    
    init(productID: Int, productName: String, productPrice: Double, productMadeInCountry: String, size: Int, isDrinkDiet: Bool){
        self.isDrinkDiet = isDrinkDiet
        super.init(productID: productID, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry, size: size)
    }
}

class Food: Product {
    let foodCalorie: Int
    let foodIngredients: [String]
    
    init(productID: Int, productName: String, productPrice: Double, productMadeInCountry: String, size: Int, foodCalorie: Int, foodIngredients: [String]) {
        self.foodCalorie = foodCalorie
        self.foodIngredients = foodIngredients
        super.init(productID: productID, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry, size: size)
    }
}

class Material: Product {
    let materialCode: Int
    
    init(productID: Int, productName: String, productPrice: Double, productMadeInCountry: String, size: Int, materialCode: Int) {
        self.materialCode = materialCode
        super.init(productID: productID, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry, size: size)
    }
}

class Cloth: Product {
    let clothMaterials: [Material]
    
    init(productID: Int, productName: String, productPrice: Double, productMadeInCountry: String, size: Int, clothMaterials: [Material]) {
        self.clothMaterials = clothMaterials
        super.init(productID: productID, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry, size: size)
    }
}


let product1 = Product(productID: 110, productName: "Diet Pepsi", productPrice: 2.00, productMadeInCountry: "USA", size: 5)
let drink1 = Drink(productID: 1, productName: "Water", productPrice: 1.50, productMadeInCountry: "Canada", size: 6, isDrinkDiet: false)
let food1 = Food(productID: 2, productName: "Pizza", productPrice: 25.00, productMadeInCountry: "Canada", size: 20, foodCalorie: 266, foodIngredients: ["Pepperoni", "Cheese", "Garlic Sauce"])
let material1 = Material(productID: 3, productName: "Polyester", productPrice: 2.17, productMadeInCountry: "China", size: 1, materialCode: 123456)
let material2 = Material(productID: 5, productName: "Goose Down", productPrice: 1.80, productMadeInCountry: "China", size: 1, materialCode: 987623)
let cloth1 = Cloth(productID: 4, productName: "Nuptse Jacket", productPrice: 349.99, productMadeInCountry: "USA", size: 10, clothMaterials: [material1, material2])

class ShoppingCart {
    var numOfItems = 0
    var totalPrice: Double = 0
    var itemsArray = [(Product, Int)]()
    
    func addToShoppingKart(item: Product, amount: Int) {
        itemsArray.append((item, amount))
    }
    
    func calculatePrice() {
        for (item, amount) in itemsArray {
            totalPrice += item.productPrice * Double(amount)
        }
    }
    
    func printItemName() {
        for (item, amount) in itemsArray {
            print("Name: \(item.productName), Amount: \(amount)")
        }
    }
}

var myShoppingCart = ShoppingCart()

myShoppingCart.addToShoppingKart(item: drink1, amount: 2)
myShoppingCart.addToShoppingKart(item: food1, amount: 1)

myShoppingCart.printItemName()

myShoppingCart.calculatePrice()
print(myShoppingCart.totalPrice)

//Problem 3

extension String {
    func isPalindrome() -> Bool {
        if self == String(self.reversed()) {
            return true
        } else {
            return false
        }
    }
    
    func reverseIt() -> String {
        return String(self.reversed())
    }
}

var word: String = "Hello"
var word2: String = "ana"
word.isPalindrome()
word2.isPalindrome()

print(word.reverseIt())
print(word2.reverseIt())

extension String {
    var numOfDigits: Int {
        return self.count
    }
    
    var allUpperCased: String {
        var newString = ""
        for letter in self {
            newString.append(letter.uppercased())
        }
        return newString
    }
}

print(word.numOfDigits)
print(word.allUpperCased)

//Problem 4

enum StringError : Error {
    case InvalidStringFormatForIntConversionError
    case InvalidEmailFormatError
    case NotValidPassword(numbersNeeded: Int)
}

extension String {
    func toInt() throws -> Int {
        if let convertedString = Int(self) {
            return convertedString
        } else {
            throw StringError.InvalidStringFormatForIntConversionError
        }
    }
    
    func checkEmailFormat() throws {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: self) {
            print("Valid Email")
        } else {
            throw StringError.InvalidEmailFormatError
        }
    }
    
    func isPasswordValid() throws {
        if self.count < 8 {
            throw StringError.NotValidPassword(numbersNeeded: 8 - self.count)
        }
    }
}

class TestExtension {
    static func convertStringToInt(word: String) -> Int? {
        do {
            return try word.toInt()
        } catch StringError.InvalidStringFormatForIntConversionError {
            print("Only numbers are convertible to Integers, not words!")
            return nil
        } catch {
            print("Unexpected Error")
            return nil
        }
    }
    
    static func isItAnEmail(word: String) -> Bool {
        do {
            try word.checkEmailFormat()
            return true
        } catch StringError.InvalidEmailFormatError {
            print("Email is invalid!")
            return false
        } catch {
            print("Unexpected Error")
            return false
        }
    }
    
    static func validatePassword(password: String) -> Bool {
        do {
            try password.isPasswordValid()
            return true
        } catch StringError.NotValidPassword(numbersNeeded: 8 - password.count) {
            print("Password too short... It needs to be 8 characters or longer!")
            return false
        } catch {
            print("Unexpected Error")
            return false
        }
    }
    
}

TestExtension.convertStringToInt(word: "12")
TestExtension.convertStringToInt(word: "car")
TestExtension.isItAnEmail(word: "ld.rocha@hotmail.com")
TestExtension.isItAnEmail(word: "aaaaaaaa")
TestExtension.validatePassword(password: "12345678")
TestExtension.validatePassword(password: "1234567")

