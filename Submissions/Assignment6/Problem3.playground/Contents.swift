import UIKit

class ServiceProvider {
    func provideService() -> Void {
        print("Service is being provided!")
    }
}

class CarRepairServiceProvider: ServiceProvider {
    let issueDescription: String
    let carModel: String
    
    override func provideService() {
        print("\(self.issueDescription) fix is being provided to car \(self.carModel).")
    }
    
    init(issue: String, model: String) {
        self.issueDescription = issue
        self.carModel = model
    }
}

class HomeServiceProvider: ServiceProvider {
    let serviceType: String
    let address: String
    
    override func provideService() {
         print("\(self.serviceType) is being provided at \(self.address).")
    }
    
    init(serviceType: String, address: String) {
        self.address = address
        self.serviceType = serviceType
    }
}

class StudentServicesProvider: ServiceProvider {
    let serviceDescription: String
    
    override func provideService() {
        print("Service of \(self.serviceDescription) is being provided to student.")
    }
    
    init(description: String) {
        self.serviceDescription = description
    }
}

class ClientA {
    let service: CarRepairServiceProvider
    
    init(service: CarRepairServiceProvider) {
        self.service = service
    }
}

class ClientB {
    let service: HomeServiceProvider
    
    init(service: HomeServiceProvider) {
        self.service = service
    }
}

class ClientC {
    let service: StudentServicesProvider
    
    init(service: StudentServicesProvider) {
        self.service = service
    }
}


class ClientD {
    let services: [ServiceProvider]
    
    init(services: [ServiceProvider]) {
        self.services = services
    }
}


enum HomeService: String {
    case CookingService = "Cooking Service"
    case WashingService = "Washing Service"
    case BabySittingService = "Baby Sitting Service"
}


let firstClient = ClientA(service: CarRepairServiceProvider(issue: "Oil Leaking", model: "Toyota Supra"))
firstClient.service.provideService()
let secondClient = ClientB(service: HomeServiceProvider(serviceType: HomeService.CookingService.rawValue, address: "12345 Amazing Street"))
secondClient.service.provideService()
let thirdClient = ClientC(service: StudentServicesProvider(description: "Tutoring"))
thirdClient.service.provideService()
let forthClient = ClientD(services: [StudentServicesProvider(description: "Math tutoring"), CarRepairServiceProvider(issue: "Charging not working", model: "Tesla S" ), HomeServiceProvider(serviceType: HomeService.WashingService.rawValue, address: "12345 Vancouver Street")])

for service in forthClient.services {
    service.provideService()
}
