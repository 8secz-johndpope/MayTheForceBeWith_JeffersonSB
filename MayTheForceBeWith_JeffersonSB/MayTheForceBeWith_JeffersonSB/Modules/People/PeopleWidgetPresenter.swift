//
//  PeoplePresenter.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

protocol PeopleWidgetPresentationLogic {
    func presentPeoples(response: [PeopleResult])
}

/// Responsible for displaying the module information PeopleWidget
final class PeopleWidgetPresenter: PeopleWidgetPresentationLogic {
    weak var viewController: PeopleWidgetDisplayLogic?
    
    func presentPeoples(response: [PeopleResult]) {
        let items = transform(peoples: response)
        viewController?.displayPeople(presentResult: items)
    }
    
    func transform(peoples: [PeopleResult]) -> [PeopleListCell.ViewModel] {
        return peoples.compactMap { people in
            PeopleListCell.ViewModel(
                url: people.url,
                name: people.name
            )
        }
    }
}
