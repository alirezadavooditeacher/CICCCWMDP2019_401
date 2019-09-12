import UIKit

class Product {
    var productID: Int
    var productName: String
    var productPrice: Double
    var productMadeInCountry: String
    
    init(productId: Int, productName: String, productPrice: Double, productMadeInCountry:String) {
        self.productID = productId
        self.productName = productName
        self.productPrice = productPrice
        self.productMadeInCountry = productMadeInCountry
    }
}

var product1 = Product(productId: 110, productName: "Diet Pepsi", productPrice: 2, productMadeInCountry: "USA")

class Drink:Product {
    var isDrinkDiet: Bool
    var drinkSize: Int
    
    init(productId: Int, productName: String, productPrice: Double, productMadeInCountry: String, isDrinkDiet: Bool, drinkSize: Int) {
        self.isDrinkDiet = isDrinkDiet
        self.drinkSize = drinkSize
        super.init(productId: productId, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry)
    }
}

var drink1 = Drink(productId: 111, productName: "coke", productPrice: 2.5, productMadeInCountry: "USA", isDrinkDiet: false, drinkSize: 330)

class Food:Product {
    var foodCalorie: Int
    var foodSize: Int
    var foodIngredients: [String]
    
    init(productId: Int, productName: String, productPrice: Double, productMadeInCountry: String, foodCalorie: Int, foodSize: Int, foodIngredients: [String]) {
        self.foodCalorie = foodCalorie
        self.foodSize = foodSize
        self.foodIngredients = foodIngredients
        super.init(productId: productId, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry)
    }
}

var food1 = Food(productId: 112, productName: "Lasagna", productPrice: 10, productMadeInCountry: "Canada", foodCalorie: 1200, foodSize: 1000, foodIngredients: ["Pasta", "Onions", "Tomatos", "Meat", "Bacon", "Cheese"])

class Cloth:Product {
    var clothMaterials: [Material]
    
    init(productId: Int, productName: String, productPrice: Double, productMadeInCountry: String, clothMaterials: [Material]) {
        self.clothMaterials = clothMaterials
        super.init(productId: productId, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry)
    }
}

class Material {
    var materialCode: Int
    var materialName: String
    init(materialCode: Int, materialName: String) {
        self.materialCode = materialCode
        self.materialName = materialName
    }
}

var material1 = Material(materialCode: 10, materialName: "Cotton")
var cloth1 = Cloth(productId: 113, productName: "Jacket", productPrice: 56, productMadeInCountry: "Canada", clothMaterials: [material1])

class ShoppingCart {
    var list:[(Product, Int)] = []
    func add(product: Product, amount: Int) {
        self.list.append((product, amount))
    }
    func getTotal() -> Double {
        var total = 0.0
        for (product, amount) in self.list {
            total += product.productPrice * Double(amount)
        }
        return total
    }
    func printList() {
        for (product, _) in self.list {
            print(product.productName)
        }
    }
}

var shoppingCart = ShoppingCart()
shoppingCart.add(product: drink1, amount: 4)
shoppingCart.add(product: food1, amount: 2)
shoppingCart.add(product: cloth1, amount: 1)

print("You will pay \(shoppingCart.getTotal()) for your purchases")
print("This is the shopping list")
shoppingCart.printList()
