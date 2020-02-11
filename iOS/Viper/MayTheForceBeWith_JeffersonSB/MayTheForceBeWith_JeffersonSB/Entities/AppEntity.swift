//
//  Constants.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

/// Application entity protocol
public protocol AppEntity {
    /// Base url for application api
    var baseURL: URL { get set }
    var basePost: URL { get set }
}

/// Model of application
final class App: AppEntity {
    private let endpointDict = Bundle.main.object(forInfoDictionaryKey: "ConfigBuild") as? [String:Any]
    
    init() {}

    var baseURL: URL {
        get {
            guard
                let value = endpointDict?["URL_BASE"] as? String,
                let url = URL(string: value)
            else {
                fatalError("Base URL should at start time of app")
            }
            return url
        }
        set {}
    }
    var basePost: URL {
        get {
            guard
                let value = endpointDict?["URL_POST"] as? String,
                let url = URL(string: value)
            else {
                fatalError("Base URL should at start time of app")
            }
            return url
        }
        set {}
    }
}
