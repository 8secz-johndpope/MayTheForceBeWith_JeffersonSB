//
//  PeopleWidgetInteractor.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

protocol DetailPeopleWidgetBusinessLogic {
    func fechPeople()
}

final class DetailPeopleWidgetInteractor: DetailPeopleWidgetBusinessLogic {
    let presenter: DetailPeopleWidgetPresentationLogic
    let provider: ProviderPeople
    
    var searchText: String?
    var canLoadMore = false
    
    private var currentPage = 1
    private var cachedPeople: [PeopleResult] = []

    init(
        presenter: DetailPeopleWidgetPresentationLogic,
        provider: ProviderPeople
    ) {
        self.presenter = presenter
        self.provider = provider

    }
    
    func fechPeople() {
        
    }
}
