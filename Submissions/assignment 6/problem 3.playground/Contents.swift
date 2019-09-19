import UIKit

protocol ServiceProvider: AnyObject {
    func provideService() -> Void
}

class CarRepairServiceProvider: ServiceProvider {
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

class HomeServiceProvider: ServiceProvider {
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

class StudentServiceProvider: ServiceProvider {
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

protocol ClientService {
    var serviceProvider: ServiceProvider? { get set }
    func getService()
}

class ClientA: ClientService {
    var serviceProvider: ServiceProvider?
    init(serviceProvider: CarRepairServiceProvider) {
        self.serviceProvider = serviceProvider
    }
    func getService() {
        if let service = self.serviceProvider {
            service.provideService()
        }
    }
}
class ClientB: ClientService {
    var serviceProvider: ServiceProvider?
    init(serviceProvider: HomeServiceProvider) {
        self.serviceProvider = serviceProvider
    }
    func getService() {
        if let service = self.serviceProvider {
            service.provideService()
        }
    }
}
class ClientC: ClientService {
    var serviceProvider: ServiceProvider?
    init(serviceProvider: StudentServiceProvider) {
        self.serviceProvider = serviceProvider
    }
    func getService() {
        if let service = self.serviceProvider {
            service.provideService()
        }
    }
}
class ClientD:ClientService {
    var serviceProvider: ServiceProvider?
    func getService() {
        if let service = self.serviceProvider {
            service.provideService()
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
clientD.serviceProvider = carService

clientA.getService()
clientB.getService()
clientC.getService()
clientD.getService()
