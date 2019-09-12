import Cocoa

var str = "Hello, playground"

enum AppleDevice {
    case iPhoneXs(Int)
    case iPhoneXR(Int)
    case iPhone8(Int)
    case iPhone7(Int)
}

var iPhoneXs = AppleDevice.iPhoneXs(1000)
var iPhoneXR = AppleDevice.iPhoneXR(1100)
var iPhone8 = AppleDevice.iPhone8(800)
var iPhone7 = AppleDevice.iPhone7(750)
