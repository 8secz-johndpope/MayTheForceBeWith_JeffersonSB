//
//  DetailPeopleWidgetBuilder.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit

public final class DetailPeopleWidgetBuilder {
    let peopleDetail: PeopleResult
    
    public init(peopleDetail: PeopleResult) {
        self.peopleDetail = peopleDetail
    }
    
    public func build() -> UIViewController {
        let presenter = DetailPeopleWidgetPresenter()
        let provider = DetailPeopleProvider()
        let interactor = DetailPeopleWidgetInteractor(
            presenter: presenter,
            provider: provider
        )
        let controller = DetailPeopleWidgetViewController(peopleDetail: peopleDetail, interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
