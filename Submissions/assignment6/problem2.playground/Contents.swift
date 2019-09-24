import Cocoa

var str = "Hello, playground"

class CarRepairServiceProvider {
    var description:String
    var carModel:String
    
    init(description:String, carModel:String) {
        self.description = description
        self.carModel = carModel
    }
    
}

class HomeServiceProvider {
    enum HomeService {
        case CookingService
        case WashingService
        case BabySittingService
    }
    
    var serviceType:HomeService
    var address:String
    
    init(serviceType:HomeService, address:String) {
        self.serviceType = serviceType
        self.address = address
    }
}

class StudentServicesProvider {
    var serviceDescription:String
    init(serviceDescription:String) {
        self.serviceDescription = serviceDescription
    }
}


class clientA {
    var serviceClientA = CarRepairServiceProvider(description: "the tires of his car are needed to be exchanged because expired", carModel: "nissanGhosn")
}

class clientB {
    var serviceClientB = HomeServiceProvider(serviceType: .CookingService, address: "00 E 100 ave." )
}

class clientC {
    var serviceClientC = StudentServicesProvider(serviceDescription: "matching between studuents and companies")
}

class clientD {

    let serviceCar = CarRepairServiceProvider(description: "check the all of parts", carModel: "TOYOTA")
    let seviceHome = HomeServiceProvider(serviceType: .WashingService, address: "King Edward")
    let serviceStudent = StudentServicesProvider(serviceDescription: "manage web page.")
    
}



let ClientA = clientA()
print(ClientA.serviceClientA)

let ClientB = clientB()
print(ClientB.serviceClientB)

let ClientC = clientC()
print(ClientC.serviceClientC)

let ClientD = clientD()
print(ClientD.serviceCar)
print(ClientD.serviceStudent)
print(ClientD.seviceHome)
