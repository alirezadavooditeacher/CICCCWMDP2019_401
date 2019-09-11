import UIKit

enum AppleDevice {
    case iPhoneXs,iPhoneXR,iPhone8,iPhone7

    var price:Int {
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

let device = AppleDevice.iPhoneXR
print("\(device) is $\(device.price)")
