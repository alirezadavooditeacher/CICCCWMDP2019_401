import UIKit

protocol ServiceProvider{
    func printService()
}

class CarRepairServiceProvider: ServiceProvider{
    var issue: String
    var carModel: String
    init(issue: String, carModel: String){
        self.issue = issue
        self.carModel = carModel
    }
    func printService() {
        print("Car Issue: \(self.issue), Model: \(self.carModel)")
    }
}

enum HomeService:String{
    case CookingService, WashingService, BabySittingService
}

class HomeServiceProvider: ServiceProvider{
    var serviceType:HomeService
    var address: String
    init(serviceType:HomeService,address: String ){
        self.serviceType = serviceType
        self.address = address
    }
    func printService() {
        print("Home service: \(self.serviceType), Address: \(self.address)")
    }
}

class StudentServicePovider: ServiceProvider{
    var studentService:String
    init(studentService:String){
        self.studentService = studentService
    }
    func printService() {
        print("Student service: \(self.studentService)")
    }
}


class clientA{ //CarRepairServiceProvider
    static let carIssue = CarRepairServiceProvider(issue:"Gas problem", carModel: "A1-000")
}
class clientB{ //StudentServicePovider
    static let studentService = StudentServicePovider(studentService: "Assignment problem")
}
class clientC{ //HomeServiceProvider
    static let homeService = HomeServiceProvider(serviceType: HomeService.BabySittingService, address: "159 W Pender St, Vancouver")
}
class clientD { 
    static let studentService = StudentServicePovider(studentService: "Lecture problem")
    static let carIssue = CarRepairServiceProvider(issue:"Tire problem", carModel: "D1-020")
    static let homeService = HomeServiceProvider(serviceType: HomeService.CookingService, address: "234, 2nd Ave, Vancouver")
}

clientA.carIssue.printService()
clientB.studentService.printService()
clientC.homeService.printService()
clientD.carIssue.printService()
clientD.homeService.printService()
clientD.studentService.printService()

