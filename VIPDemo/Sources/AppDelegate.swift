//
//  AppDelegate.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Override point for customization after application launch.

        let viewController = ViewController()

        let screen = UIScreen.main
        window = UIWindow(frame: screen.bounds)
        window?.rootViewController = viewController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        return true
    }
}
