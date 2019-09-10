import UIKit

/* Problem2
 Define an Enum, called AppleDevice with the following cases:
 - iPhoneXs
 - iPhoneXR
 - iPhone8
 - iPhone7
 Add a computed property to the enum which returns the price of each of the above item.
 上記の各アイテムの価格を返す計算プロパティを列挙に追加します。
 Here is the list of price (in $):
 - iPhoneXs: 1000
 - iPhoneXR: 1100
 - iPhone8: 800
 - iPhone7: 750
 */

enum AppleDevice {
    case iPhoneXs
    case iPhoneXR
    case iPhone8
    case iPhone7
    
    // computed property
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

let iPhoneXs = AppleDevice.iPhoneXs
func printPrice (price: AppleDevice) {
    print(price.price)
}

printPrice(price: iPhoneXs)

