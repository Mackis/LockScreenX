//
//  Theme.swift
//  LockScreenX
//
//  Created by Malcolm Kumwenda on 2017/09/15.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit

class Theme {
    class fonts {
        class func avenirLight(size: CGFloat) -> UIFont{
            return UIFont(name: "Avenir-Light", size: size)!
        }
        
        class func avenirBlack(size: CGFloat) -> UIFont{
            return UIFont(name: "Avenir-Black", size: size)!
        }
        
        class func avenirMedium(size: CGFloat) -> UIFont {
            return UIFont(name: "Avenir-Medium", size: size)!
        }
    }
    
    class inset {
        static var single = 8
        static var double = 16
        static var triple = 32
    }
}
