import Cocoa

var str = "Hello, playground"

class Product {
    
    // if you use init function, you don't need to inirialize any value.
    var productID:Int
    var productName: String
    var productPrice:Double
    var productMadeInCountry : String

    init(productid: Int, productName: String, productPrice: Double, productMadeInCountry: String) {
    self.productID = productid
    self.productName = productName
    self.productPrice = productPrice
    self.productMadeInCountry = productMadeInCountry
}
}

let productPepsi = Product(productid: 110, productName: "Diet Pepsi", productPrice: 2, productMadeInCountry: "USA")
//product.productID = 110
//product.productName = "Diet Pepsi"
//product.productPrice = 2
//product.productMadeInCountry = "USA"

class Drink:Product {
    var isDrinkDiet:Bool
    var drinkSize: Int
    
    init(productid: Int, productName: String, productPrice: Double, productMadeInCountry: String, isDrinkDiet: Bool, drinkSize: Int) {
        self.isDrinkDiet = isDrinkDiet
        self.drinkSize = drinkSize
        super.init(productid: productid, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry)
    }
}

class Food:Product {
    var foodCalorie:Int
    var foodSize:Int
    var foodIngredients:[String]
    
    init(productid: Int, productName: String, productPrice: Double, productMadeInCountry: String, foodCalorie: Int, foodSize: Int, foodIngredients:[String]) {
        self.foodCalorie = foodCalorie
        self.foodSize = foodSize
        self.foodIngredients = foodIngredients
        
        super.init(productid: productid, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry)
    }
}


class Material {
    var MaterialCode:Int
    var MaterialName:String
    
    init(MaterialCode:Int, MaterialName:String) {
        self.MaterialCode = MaterialCode
        self.MaterialName = MaterialName
    }
}

class Cloth:Product {
    var ClothMaterials:[Material]
    
    init(productid: Int, productName: String, productPrice: Double, productMadeInCountry: String, ClothMaterials:[Material]) {
        self.ClothMaterials = ClothMaterials
        super.init(productid: productid, productName: productName, productPrice: productPrice, productMadeInCountry: productMadeInCountry)
    }
    
}

let Pepsi = Drink(productid: 412, productName: "Pepsi", productPrice: 2, productMadeInCountry: "USA", isDrinkDiet: false, drinkSize: 150)

let gingerZero = Drink(productid: 183, productName: "Ginger Zero", productPrice: 3, productMadeInCountry: "Canada", isDrinkDiet: true, drinkSize: 200)

let Chicken = Food(productid: 100, productName: "Chicken", productPrice: 8, productMadeInCountry: "Canada", foodCalorie: 350, foodSize: 4, foodIngredients: ["Chicken","oil","Cheese"])

let Pasta = Food(productid: 101, productName: "Pasta", productPrice: 18, productMadeInCountry: "Canada", foodCalorie: 250, foodSize: 3, foodIngredients: ["pasta", "meat", "spinach"])

let Cotton = Material(MaterialCode: 10, MaterialName: "Cotton")
let Nyron = Material(MaterialCode: 11, MaterialName: "Nyron")

let tShirt = Cloth(productid: 701, productName: "T-shirt", productPrice: 15, productMadeInCountry: "China", ClothMaterials: [Cotton, Nyron])

class ShoppingCart {
    var HasShoppingCart:[(Product, Int)] = []
    var price:Double = 0.0
    
    func addShoppingCart(item:Product, amount: Int) -> [(Product, Int)] {
        
        HasShoppingCart.append((item, amount))
        return HasShoppingCart
    }
    
    func PriceCaluculator() -> Double {
        
        for (item, amount) in HasShoppingCart{
            price += item.productPrice * Double(amount)
        }
        return price
    }
    
    func printProduct() {
        for (value, _) in HasShoppingCart{
            print(value.productName)
        }
    }
}
let arrayPerchase = [Pepsi, gingerZero, Chicken, Pasta, tShirt]

//let pepsiPerchased = ShoppingCart.addShoppingCart(item: arrayPerchase[0], amount: 3)
//let gingerZeroPerchased = ShoppingCart.addShoppingCart(item: arrayPerchase[1], amount: 1)
//let chickenPerchased = ShoppingCart.addShoppingCart(item: arrayPerchase[2], amount: 2)
//let pastaPerchased = ShoppingCart.addShoppingCart(item: arrayPerchase[3], amount: 2)
//let tShirtPerchased = ShoppingCart.addShoppingCart(item: arrayPerchase[4], amount: 1)
//print(ShoppingCart.HasShoppingCart)

let drink2 = Drink(productid: 3, productName: "water", productPrice: 120, productMadeInCountry: "Canada", isDrinkDiet: false, drinkSize: 3)

let myShoppingCart = ShoppingCart()
myShoppingCart.addShoppingCart(item: drink2, amount: 3)
myShoppingCart.PriceCaluculator()
myShoppingCart.printProduct()



