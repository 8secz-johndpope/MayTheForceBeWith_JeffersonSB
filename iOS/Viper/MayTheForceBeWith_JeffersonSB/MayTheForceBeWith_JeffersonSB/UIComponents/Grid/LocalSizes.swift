//
//  LocalSizes.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 12/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit

public protocol LocalSizes {
    static var gridUnitSize: CGSize { get }
}

public extension LocalSizes {
    
    static var xxxS: CGFloat { return 1 }
    static var xxS: CGFloat { return 2 }
    
    var xxxsSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxxS) }
}
