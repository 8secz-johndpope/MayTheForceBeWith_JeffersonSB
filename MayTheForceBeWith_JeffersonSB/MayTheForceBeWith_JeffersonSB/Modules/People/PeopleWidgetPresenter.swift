//
//  PeoplePresenter.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

protocol PeopleWidgetPresentationLogic {
    func presentPeoples(param: String)
}

/// Responsible for displaying the module information PeopleWidget
final class PeopleWidgetPresenter: PeopleWidgetPresentationLogic {
    weak var viewController: PeopleWidgetDisplayLogic?
    
    func presentPeoples(param: String) {
        viewController?.displayPeople(param: param)
    }
}
