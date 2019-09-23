import UIKit

protocol provider:AnyObject {
    func getService()->Void
    
}

class CarRepairServiceProvider:provider {
    var issueDescription = "Flat tires"
    var carModel = "Honda"
    
    func getService() {
        print("\(issueDescription) service is being provided")
        print("car model is \(carModel)")
    }
}

class HomeServiceProvider:provider {
    func getService() {
        let service = HomeService.init(rawValue: 1)
        service?.getServiceTypeAndAddress()
    }
    
    enum HomeService:Int {
        case CookingService=1 , WashingService, BabySittingService
        
        func getServiceTypeAndAddress(){
            switch self {
            case .CookingService:
                print("CookingService is provided.","Address is Canada")
            case .WashingService:
                print("WashingService is provided.","Address is America")
            case .BabySittingService:
                print("BabySittingService is provided.","Address is Japan")
            }
        }
    }
}

class StudentServicesProvider:provider {
    var studentServiceDiscription = "Student Service is provided. Many students are going to help you!"
    
    func getService() {
        print("\(studentServiceDiscription)")
    }
}

class CliantA {
    var delegate: provider? = CarRepairServiceProvider()
    
    func useService() {
        delegate?.getService()
    }
}
var clienta = CliantA()
clienta.useService()

class CliantB {
    var delegate: provider? = HomeServiceProvider()
    func useService() {
        delegate?.getService()
    }
}
var cliantb = CliantB()
cliantb.useService()

class CliantC {
    var delegate: provider? = StudentServicesProvider()
    func useService() {
        delegate?.getService()
    }
}
var cliantc = CliantC()
cliantc.useService()

class CliantD {
    var delegate:[provider] = [CarRepairServiceProvider(),HomeServiceProvider(),StudentServicesProvider()]
    func useService() {
        delegate[0].getService()
        delegate[1].getService()
        delegate[2].getService()
    }
}
var cliantd = CliantD()
cliantd.useService()
