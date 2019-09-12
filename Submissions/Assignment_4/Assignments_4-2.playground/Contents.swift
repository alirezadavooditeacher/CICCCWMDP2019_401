import UIKit
//problem 2

enum AppleDevice: Int{
    case iPhoneXs, iPhoneXR, iPhone8, iPhone7
    var price: Int {
        switch self{
        case .iPhone7: return 750
        case .iPhone8: return 800
        case .iPhoneXR: return 1100
        case .iPhoneXs: return 1000
        }
    }
}
print("iphone7:\(AppleDevice.iPhone7.price)")
print("iphone8:\(AppleDevice.iPhone8.price)")
print("iphoneXR:\(AppleDevice.iPhoneXR.price)")
print("iphoneXs:\(AppleDevice.iPhoneXs.price)")

