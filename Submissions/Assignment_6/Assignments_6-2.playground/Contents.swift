import UIKit

class CarRepairServiceProvider{
    var issue: String
    var carModel: String
    init(issue: String, carModel: String){
        self.issue = issue
        self.carModel = carModel
    }
}

enum HomeService:String{
    case CookingService, WashingService, BabySittingService
}

class HomeServiceProvider{
    var serviceType:HomeService
    var address: String
    init(serviceType:HomeService,address: String ){
        self.serviceType = serviceType
        self.address = address
    }
 }

class StudentServicePovider{
    var studentService:String
    init(studentService:String){
        self.studentService = studentService
    }
}


class clientA{
   static let car = CarRepairServiceProvider.init(issue: "Broken", carModel:"A1")
}
class clientB{
    static let student = StudentServicePovider.init(studentService: "service_B")
}
class clientC{
    static let home = HomeServiceProvider(serviceType: .CookingService, address: "street 123")
}
class clientD{
    static let car = CarRepairServiceProvider.init(issue: "Gas problem", carModel:"D1")
    static let student = StudentServicePovider.init(studentService: "service_D")
    static let home = HomeServiceProvider(serviceType: .CookingService, address: "street 456")
}

print("ClientA: \(clientA.car.issue), \(clientA.car.carModel)")
print("ClientB: \(clientB.student.studentService)")
print("ClientC: \(clientC.home.serviceType),\(clientC.home.address)")
print("ClientD: \(clientD.car.issue),\(clientD.car.carModel),\(clientD.home.address),\( clientD.student.studentService)")

