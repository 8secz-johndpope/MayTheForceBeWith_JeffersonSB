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
        provider.fechPeople(success: { [weak self] response in
            response.results.forEach {
                self?.presenter.presentPeoples(param: $0.name)
            }
        }, failure: { error in
            print("ERROR")
            self.presenter.presentPeoples(param: "error \(error.description)")
        })
    }
}
