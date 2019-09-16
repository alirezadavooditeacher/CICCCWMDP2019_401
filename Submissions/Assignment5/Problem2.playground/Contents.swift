import UIKit

class Product{
    var productID: Int
    var productName: String
    var productPrice: Double
    var productMadeInCountry: String
    
    init(productid: Int, productName: String, productPrice: Double,
              productMadeInCountry: String) {
        self.productID = productid
        self.productName = productName
        self.productPrice = productPrice
        self.productMadeInCountry = productMadeInCountry
    }
}

class Drink:Product {
    var isDrinkDiet: Bool
    var drinkSize: Int
    
    init(drinkid:Int, drinkName:String, drinkPrice:Double,drinkMadeInCountry:String, isDrinkDiet:Bool,drinkSize:Int) {
        self.isDrinkDiet = isDrinkDiet
        self.drinkSize = drinkSize
        super.init(productid: drinkid, productName: drinkName, productPrice: drinkPrice, productMadeInCountry: drinkMadeInCountry)
    }
    
}

class Food:Product {
    var foodCalorie: Int
    var foodSize: Int
    var foodIngredients: [String]
    
    init( foodid: Int, foodName: String, foodPrice: Double, foodMadeInCountry: String,
          foodCalorie: Int,foodSize: Int, foodIngredients:[String]) {
        self.foodCalorie = foodCalorie
        self.foodSize = foodSize
        self.foodIngredients = foodIngredients
        super.init(productid: foodid, productName: foodName, productPrice: foodPrice, productMadeInCountry: foodMadeInCountry)
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
class Cloth:Product {
    var clothMaterials: [Material]
    
    init( clothid: Int, clothName: String, clothPrice: Double, clothMadeInCountry: String,
          clothMaterials: [Material]) {
        self.clothMaterials = clothMaterials
        super.init(productid: clothid, productName: clothName, productPrice: clothPrice, productMadeInCountry: clothMadeInCountry)
    }
}

class ShoppingCart {
    var listOfProduct = [(Product,Int)]()
    
    func makeShoppingList(products:(Product,Int)) {
        listOfProduct.append(products)
    }
    
    func caculateTotal() -> Int {
        var total:Int = 0
        for product in listOfProduct {
            total += product.1 * Int(product.0.productPrice)
            print("\(product.0.productName) \(product.1) * \(product.0.productPrice) = \(total)")
        }
        return total
    }
}
var pepsiDrink = Drink.init(drinkid: 412, drinkName: "pepsi", drinkPrice: 2, drinkMadeInCountry: "USA", isDrinkDiet: false, drinkSize: 150)
var gingerDrink = Drink.init(drinkid: 183, drinkName: "Ginger Zero", drinkPrice: 3, drinkMadeInCountry: "Canada", isDrinkDiet: true, drinkSize: 200)
var chikinFood = Food.init(foodid: 100, foodName: "chiken", foodPrice: 8, foodMadeInCountry: "Canada", foodCalorie: 350, foodSize: 4, foodIngredients: ["chichken","oil","chees"])
var pastaFood = Food.init(foodid: 101, foodName: "Pasta", foodPrice: 18, foodMadeInCountry: "Canada", foodCalorie: 250, foodSize: 31, foodIngredients: ["pasta","meet","spinach"])
var tShirtCloth = Cloth.init(clothid: 701, clothName: "T-shirt", clothPrice: 15, clothMadeInCountry: "China", clothMaterials: [Material.init(materialCode: 10, materialName: "cotton"),Material.init(materialCode: 11, materialName: "Nylon")])

var shopping = ShoppingCart()
shopping.listOfProduct.append((pepsiDrink,3))
shopping.listOfProduct.append((gingerDrink,1))
shopping.listOfProduct.append((chikinFood,2))
shopping.listOfProduct.append((pastaFood,2))
shopping.listOfProduct.append((tShirtCloth,1))

var total = shopping.caculateTotal()
print("Total price is $\(total)")



