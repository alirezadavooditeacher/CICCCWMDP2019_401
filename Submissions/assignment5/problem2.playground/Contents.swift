import UIKit

/* Problem 2: Inheritance
*/


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
