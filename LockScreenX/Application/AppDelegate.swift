//
//  AppDelegate.swift
//  LockScreenX
//
//  Created by Malcolm Kumwenda on 2017/09/15.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LockScreenVC()
        window?.makeKeyAndVisible()
        return true
    }
}





  
