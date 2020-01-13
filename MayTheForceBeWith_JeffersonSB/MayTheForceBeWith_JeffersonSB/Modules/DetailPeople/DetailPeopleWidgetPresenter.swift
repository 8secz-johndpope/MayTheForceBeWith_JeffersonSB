//
//  DetailPeoplePresenter.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

protocol DetailPeopleWidgetPresentationLogic {
    func presentError(with error: String)
}

/// Responsible for displaying the module information PeopleWidget
final class DetailPeopleWidgetPresenter: DetailPeopleWidgetPresentationLogic {

    weak var viewController: DetailPeopleWidgetDisplayLogic?

    func presentError(with error: String) {
        viewController?.displayError(with: error)
    }
}
