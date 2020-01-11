//
//  PeopleWidgetInteractor.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

protocol PeopleWidgetBusinessLogic {
    func fechPeople()
}

final class PeopleWidgetInteractor: PeopleWidgetBusinessLogic {
    let presenter: PeopleWidgetPresentationLogic
    let provider: ProviderPeople

    init(
        presenter: PeopleWidgetPresentationLogic,
        provider: ProviderPeople
    ) {
        self.presenter = presenter
        self.provider = provider

    }
    
    func fechPeople() {
        let msg = provider.fechPeople()
        presenter.presentPeoples(param: msg)
    }
}
