//
//  PeopleWidgetBuilder.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit

public final class PeopleWidgetBuilder {
    public init() {}
    
    public func build() -> UIViewController {
        let presenter = PeopleWidgetPresenter()
        let provider = PeopleProvider()
        let interactor = PeopleWidgetInteractor(
            presenter: presenter,
            provider: provider
        )
        let controller = PeopleWidgetViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
