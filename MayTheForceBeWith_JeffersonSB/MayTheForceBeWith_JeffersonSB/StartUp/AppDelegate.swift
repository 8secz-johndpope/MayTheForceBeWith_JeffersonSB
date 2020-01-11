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
    let appearance = UINavigationBarAppearance()
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().standardAppearance = appearance
  }
}

