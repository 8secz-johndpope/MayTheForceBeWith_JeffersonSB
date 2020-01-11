//
//  AppService.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

public final class AppService {
    public static let shared = AppService()
    /// Current application model
    public var app: AppEntity = App()
}
