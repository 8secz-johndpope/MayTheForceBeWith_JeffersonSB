//
//  PeopleWidgetInteractor.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

protocol DetailPeopleWidgetBusinessLogic {
    func fechPeopleDetail(detail: PeopleResult)
    func doFavorite(isFavorite: Bool)
}

final class DetailPeopleWidgetInteractor: DetailPeopleWidgetBusinessLogic {
    let presenter: DetailPeopleWidgetPresentationLogic
    let provider: DetailPeopleProviderProtocol
    
    private var cachedDetail: PeopleResult?

    init(
        presenter: DetailPeopleWidgetPresentationLogic,
        provider: DetailPeopleProviderProtocol
    ) {
        self.presenter = presenter
        self.provider = provider

    }
    
    func fechPeopleDetail(detail: PeopleResult) {
        cachedDetail = detail
        presenter.presentUnFavoritedPeople(detail: detail)
    }
    
    func doFavorite(isFavorite: Bool) {
        guard let peopleDetail = cachedDetail else {
           return presenter.presentError(with: "This person was not found")
        }
        provider.favoritePeople(success: { [weak self] response in
            if isFavorite {
                self?.presenter.presentUnFavoritedPeople(detail: peopleDetail)
            } else {
                self?.presenter.presentFavoritedPeople(detail: peopleDetail)
            }
        }, failure: { error in
            self.presenter.presentError(with: error)
        })
    }
}
