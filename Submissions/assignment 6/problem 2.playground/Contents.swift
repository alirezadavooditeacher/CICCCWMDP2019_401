import UIKit

class CarRepairServiceProvider {
    var description: String
    var model: String
    init(description: String, model: String) {
        self.description = description
        self.model = model
    }
    func provideService() {
        print("This is the service \(self.description) for \(self.model)")
    }
}

class HomeServiceProvider {
    var serviceType: HomeService
    var address: String
    init(address: String, serviceType: HomeService) {
        self.address = address
        self.serviceType = serviceType
    }
    func provideService() {
        print("This is the service \(self.serviceType.rawValue) at \(self.address)")
    }
}

class StudentServiceProvider {
    var description: String
    init(description: String) {
        self.description = description
    }
    func provideService() {
        print("This is the service \(self.description) provided by a student")
    }
}

enum HomeService: String {
    case CookingService = "Cooking Service"
    case WashingService = "Washing Service"
    case BabySittingService = "Baby Sitting Service"
}

protocol ServiceProvider: AnyObject {
    func provideService() -> Void
}
extension CarRepairServiceProvider: ServiceProvider {}
extension HomeServiceProvider: ServiceProvider {}
extension StudentServiceProvider: ServiceProvider {}

class ClientA {
    var serviceProvider: CarRepairServiceProvider
    init(serviceProvider: CarRepairServiceProvider) {
        self.serviceProvider = serviceProvider
    }
    func getService() {
        serviceProvider.provideService()
    }
}
class ClientB {
    var serviceProvider: HomeServiceProvider
    init(serviceProvider: HomeServiceProvider) {
        self.serviceProvider = serviceProvider
    }
    func getService() {
        serviceProvider.provideService()
    }
}
class ClientC {
    var serviceProvider: StudentServiceProvider
    init(serviceProvider: StudentServiceProvider) {
        self.serviceProvider = serviceProvider
    }
    func getService() {
        serviceProvider.provideService()
    }
}
class ClientD {
    var serviceProvider: [ServiceProvider]?
    func getService() {
        if let services = serviceProvider {
            for service in services {
                service.provideService()
            }
        }
    }
}

let carService = CarRepairServiceProvider(description: "Fix Engine", model: "Ford Mustang")
let homeService = HomeServiceProvider(address: "842, 32nd Avenue - V5V 2Y8", serviceType: HomeService.CookingService)
let studentService = StudentServiceProvider(description: "Book scan")

let clientA = ClientA(serviceProvider: carService)
let clientB = ClientB(serviceProvider: homeService)
let clientC = ClientC(serviceProvider: studentService)
let clientD = ClientD()
clientD.serviceProvider = [carService, homeService, studentService]

clientA.getService()
clientB.getService()
clientC.getService()
clientD.getService()