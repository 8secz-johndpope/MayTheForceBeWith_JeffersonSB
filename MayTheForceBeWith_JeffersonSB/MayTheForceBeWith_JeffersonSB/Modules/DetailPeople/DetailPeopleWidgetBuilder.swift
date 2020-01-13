//
//  DetailPeopleWidgetBuilder.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit

public final class DetailPeopleWidgetBuilder {
    public init() {}
    
    public func build() -> UIViewController {
        let presenter = DetailPeopleWidgetPresenter()
        let provider = PeopleProvider()
        let interactor = DetailPeopleWidgetInteractor(
            presenter: presenter,
            provider: provider
        )
        let controller = DetailPeopleWidgetViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
