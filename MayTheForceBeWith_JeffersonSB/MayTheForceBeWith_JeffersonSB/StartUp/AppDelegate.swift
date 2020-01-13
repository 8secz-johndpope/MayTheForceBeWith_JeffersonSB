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
    navigationController.setNavigationBarHidden(false, animated: false)
    navigationController.navigationBar.isTranslucent = true
    navigationController.navigationBar.tintColor = .gray
    navigationController.navigationBar.barTintColor = .blackShark
    navigationController.navigationBar.backgroundColor = .blackShark
    
    if #available(iOS 11.0, *) {
        UINavigationBar.appearance().largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor:UIColor.white,
             NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 22)]
    }

    window?.rootViewController = navigationController
  }
}

