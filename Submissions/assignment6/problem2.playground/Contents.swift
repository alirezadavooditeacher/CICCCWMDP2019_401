import UIKit

/* Problem2
 1. Create a Swift playground. Create a swift class called CarRepairServiceProvider which provides a car repair service. This class requires some information to work: a) Description issue and b) car model.
 
 2. Create another service provider class called, HomeServiceProvider which performs three (3) types of home services 1) CookingService 2) WashingService 3) BabySittingService. Create an enum called HomeService with the above items. This class also requires some information to work: 1- service type (any of the above services) and 2- address the service should be done in.
 
 3つのタイプのホームサービスを実行するHomeServiceProviderという別のサービスプロバイダークラスを作成します。
 1）CookingService 2）WashingService 3）BabySittingService。上記の項目でHomeServiceという列挙を作成します。また、このクラスは機能するためにいくつかの情報を必要とします：1-サービスタイプ（上記のサービスのいずれか）および2-サービスが行われるべきアドレス。
 
 3. Create a new service provider Swift class called, StudentServicesProvider which provide one student service. It needs the following requirements: 1- student service description an
 
 4. Define a clientA class who is interested in CarRepairServiceProvider.
 
 5. Define a clientB class who is interested in HomeServiceProvider.
 
 6. Define a clientC class who is interested in StudentServicesProvider.
 
 7. Define a clientD class who is interested in all above services.
 
 8. Use delegation pattern to implement this problem.
 */

class CarRepairServiceProvider {
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

class HomeServiceProvider {
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

class StudentServicesProvider {
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
