//
//  AppDelegate.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 10/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func applicationDidFinishLaunching(_ application: UIApplication) {
    let controller = Router.rootViewController()
    let navigationController = UINavigationController(rootViewController: controller)
    navigationController.setNavigationBarHidden(true, animated: false)

    window?.backgroundColor = .white
    window?.rootViewController = navigationController
  }
}

