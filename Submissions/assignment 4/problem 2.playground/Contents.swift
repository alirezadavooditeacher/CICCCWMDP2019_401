import UIKit

enum AppleDevice {
    case iPhoneXs, iPhoneXR, iPhone8, iPhone7
    var price: Int {
        switch self {
        case .iPhoneXs:
            return 1000
        case .iPhoneXR:
            return 1100
        case .iPhone8:
            return 800
        case .iPhone7:
            return 750
        }
    }
}

let iphoneXs = AppleDevice.iPhoneXs
let iphoneXR = AppleDevice.iPhoneXR
let iphone8 = AppleDevice.iPhone8
let iphone7 = AppleDevice.iPhone7
print("The price of iPhoneXR is $\(iphoneXR.price)")
print("The price of iPhoneXs is $\(iphoneXs.price)")
print("The price of iPhone8 is $\(iphone8.price)")
print("The price of iPhone7 is $\(iphone7.price)")
