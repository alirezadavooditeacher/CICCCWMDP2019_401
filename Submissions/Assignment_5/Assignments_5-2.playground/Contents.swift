import UIKit

class Product{
    var productID:Int
    var productName:String
    var productPrice:Double
    var productMadeInCountry:String
    
init(productid:Int,productName:String,productPrice:Double,productMadeInCountry:String){
        self.productID = productid
        self.productName = productName
        self.productPrice = productPrice
        self.productMadeInCountry = productMadeInCountry
    }
}

var test = Product(productid: 110, productName: "Diet Pepsi", productPrice: 2.0, productMadeInCountry: "USA")

class Drink:Product{
    var isDrinkDiet:Bool
    var Size:Int
    init(productid:Int,productName:String,productPrice:Double,productMadeInCountry:String,isDrinkDiet:Bool,Size:Int){
        self.isDrinkDiet = isDrinkDiet
        self.Size = Size
        super.init(productid: productid, productName: productName, productPrice: productPrice,productMadeInCountry: productMadeInCountry)
    }
}

class Food:Product{
    var calorie:Int
    var Size:Int
    var Ingredients:[String]
    
    init(productid:Int,productName:String,productPrice:Double,productMadeInCountry:String,calorie: Int,Size:Int,Ingredients:[String]){
        
        self.calorie = calorie
        self.Ingredients = Ingredients
        self.Size = Size
        
        super.init(productid: productid, productName: productName, productPrice: productPrice,productMadeInCountry: productMadeInCountry)
    }
}

class Cloth:Product{
    var materials:[Material]
    init(productid:Int,productName:String,productPrice:Double,productMadeInCountry:String,materials:[Material]){
        
        self.materials = materials

        super.init(productid: productid, productName: productName, productPrice: productPrice,productMadeInCountry: productMadeInCountry)
    }
    
}
class Material{
    var MaterialCode:Int
    var MaterialName:String
    init(MaterialCode:Int,MaterialName:String){
        self.MaterialCode = MaterialCode
        self.MaterialName = MaterialName
    }
}

let drink = Drink(productid: 1, productName: "Bubble Tea", productPrice: 5.5, productMadeInCountry: "Taiwan", isDrinkDiet: false, Size: 700)

let food = Food(productid: 2, productName: "Cake", productPrice: 6.2, productMadeInCountry: "Japan", calorie: 200, Size: 200, Ingredients: ["egg","flour","fruits"])

let material = Material(MaterialCode: 123, MaterialName: "fabric")

let cloth = Cloth.init(productid: 3, productName: "Jaket", productPrice: 45, productMadeInCountry: "USA", materials: [material])



class shoppingChart{
    static var FoodList:[Food] = []
    static var DrinkList:[Drink] = []
    static var ClothList:[Cloth] = []

    static func AddDrink(item_D:Drink){
        DrinkList.append(item_D)
        }
    static func AddFood(item_F:Food){
        FoodList.append(item_F)
    }
    static func AddCloth(item_C:Cloth){
        ClothList.append(item_C)
    }
    
    static func TotalAmount()->Double{
        var sum = 0.0
        //let shop = shoppingChart()
        for value in FoodList{
            sum += value.productPrice
        }
        for value in DrinkList{
            sum += value.productPrice
        }
        for value in ClothList{
            sum += value.productPrice
        }
        return sum
    }
    static func PrintName(){
        for value in FoodList{
            print(value.productName)
        }
        for value in DrinkList{
            print(value.productName)
        }
        for value in ClothList{
            print(value.productName)
        }
    }
}

shoppingChart.AddCloth(item_C: cloth)
shoppingChart.AddDrink(item_D: drink)
shoppingChart.AddFood(item_F: food)
shoppingChart.TotalAmount()
shoppingChart.PrintName()



