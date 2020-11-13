//
//  AppDelegate.swift
//  MapWeather
//
//  Created by Grace Njoroge on 11/11/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
    return true
  }

}

