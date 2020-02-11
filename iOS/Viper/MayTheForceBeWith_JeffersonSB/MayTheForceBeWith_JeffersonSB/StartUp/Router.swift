//
//  Router.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit

final class Router: NSObject {
    static func rootViewController() -> UIViewController {
        let viewController: UIViewController = PeopleWidgetBuilder()
            .build()
        viewController.title = "MayTheForceBeWith Jeff"
        return viewController
    }
    
    static func detailViewController(peopleDetail: PeopleResult) -> UIViewController {
        let viewController: UIViewController = DetailPeopleWidgetBuilder(peopleDetail: peopleDetail)
            .build()
        viewController.title = "About"
        return viewController
    }
}
