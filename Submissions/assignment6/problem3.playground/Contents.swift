import UIKit

/* Problem3
 In Problem 1 you are going to improve the code you have done in Problem0.
 1- Create a Service Provider class as a parent (base) class and make all your service classes (CarRepairServiceProvider, HomeServiceProvider, StudentServicesProvider,...) inherits
 from this parent class. Make any other necessary changes.
 2- Create an protocol which is the parent of all protocols you have defined in your Problem0.
 Now think about this: Now, do you need the other protocols at all anymore? If No, then remove them and make corresponding changes. If Yes, then make corresponding changes.
 After the making any possible changes your application should still be able to deliver the same functionalities as Problem 0.
 
 問題1では、Problem0で行ったコードを改善します。
     1-親（ベース）クラスとしてサービスプロバイダークラスを作成し、すべてのサービスクラス（CarRepairServiceProvider、HomeServiceProvider、StudentServicesProvider、...）が継承するようにします
     この親クラスから。 その他の必要な変更を加えます。
     2- Problem0で定義したすべてのプロトコルの親であるプロトコルを作成します。
     さて、これについて考えてみましょう。さて、あなたはもう他のプロトコルがもう必要ですか？ いいえの場合は、それらを削除して、対応する変更を加えます。 はいの場合、対応する変更を行います。
     可能な変更を行った後も、アプリケーションは問題0と同じ機能を提供できるはずです。
 */



protocol ServiceProvider {
    var description: String {get}
    func quote()
}



class CarRepairServiceProvider: ServiceProvider {
    var description = ""
    var carModel = ""
    init (description: String, carModel: String) {
        self.description = description
        self.carModel = carModel
    }
    
    func quote() {
        print("Description: \(description)\nCar model: \(carModel)\nRepair price: $2000\n")
    }
    
    
}

class HomeServiceProvider: ServiceProvider {
    var description = ""
    var serviceType: HomeService
    var address = ""
    
    enum HomeService: String {
        case CookingService = "Cooking Service"
        case WashingService = "Washing Service"
        case BabySittingService = "Baby Sitting Service"
    }
    
    init (serviceType: HomeService, address: String) {
        self.serviceType = serviceType
        self.address = address
    }
    
    func quote() {
        print("Service Type: \(serviceType.rawValue)\nAddress: \(address)\nService price: $150\n")
    }
    
    
}

class StudentServicesProvider: ServiceProvider {
    var description = ""
    init (description: String) {
        self.description = description
    }
    
    func quote() {
        print("Description: \(description)\nService price: $100\n")
    }
}

// interested in CarRepairServiceProvider
class ClientA {
    var carRepairServiceProvider: CarRepairServiceProvider
    init (carRepairServiceProvider: CarRepairServiceProvider) {
        self.carRepairServiceProvider = carRepairServiceProvider
    }
    func requestQuote() {
        carRepairServiceProvider.quote()
    }
}
let cAinfo = CarRepairServiceProvider(description: "Spring is broken", carModel: "Choro-Q")
let clientA = ClientA(carRepairServiceProvider: cAinfo)
print("ClientA")
clientA.requestQuote()

// interested in HomeServiceProvider
class ClientB {
    var homeServiceProvider: HomeServiceProvider
    init (homeServiceProvider: HomeServiceProvider) {
        self.homeServiceProvider = homeServiceProvider
    }
    
    func requestQuote() {
        homeServiceProvider.quote()
    }
}
let cBinfo = HomeServiceProvider(serviceType: HomeServiceProvider.HomeService.BabySittingService, address: "Find me")
let clientB = ClientB(homeServiceProvider: cBinfo)
print("ClientB")
clientB.requestQuote()



// interested in StudentServicesProvider
class ClientC {
    var studentServicesProvider: StudentServicesProvider
    init (studentServicesProvider: StudentServicesProvider) {
        self.studentServicesProvider = studentServicesProvider
    }
    
    func requestQuote() {
        studentServicesProvider.quote()
    }
}
let cCinfo = StudentServicesProvider(description: "something")
let clientC = ClientC(studentServicesProvider: cCinfo)
print("ClientC")
clientC.requestQuote()



// interested in all service
class ClientD {
    var carRepairServiceProvider: CarRepairServiceProvider
    var homeServiceProvider: HomeServiceProvider
    var studentServicesProvider: StudentServicesProvider
    init (carRepairServiceProvider: CarRepairServiceProvider,  homeServiceProvider: HomeServiceProvider, studentServicesProvider: StudentServicesProvider) {
        self.carRepairServiceProvider = carRepairServiceProvider
        self.homeServiceProvider = homeServiceProvider
        self.studentServicesProvider = studentServicesProvider
    }
    
    func requestQuote() {
        carRepairServiceProvider.quote()
        homeServiceProvider.quote()
        studentServicesProvider.quote()
    }
}

let cDcar = CarRepairServiceProvider(description: "Spring is broken", carModel: "Choro-Q")
let cDhome = HomeServiceProvider(serviceType: HomeServiceProvider.HomeService.BabySittingService, address: "Find me")
let cDstudent = StudentServicesProvider(description: "something")
let clientD = ClientD(
    carRepairServiceProvider: cDcar,
    homeServiceProvider: cDhome,
    studentServicesProvider: cDstudent)
print("ClientD--------")
clientD.requestQuote()


