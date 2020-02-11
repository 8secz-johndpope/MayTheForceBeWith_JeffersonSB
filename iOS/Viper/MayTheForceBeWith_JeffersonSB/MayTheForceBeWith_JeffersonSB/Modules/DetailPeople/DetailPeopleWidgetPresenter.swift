//
//  DetailPeoplePresenter.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

protocol DetailPeopleWidgetPresentationLogic {
    func presentUnFavoritedPeople(detail: PeopleResult)
    func presentFavoritedPeople(detail: PeopleResult)
    func presentError(with error: String)
}

/// Responsible for displaying the module information PeopleWidget
final class DetailPeopleWidgetPresenter: DetailPeopleWidgetPresentationLogic {
    weak var viewController: DetailPeopleWidgetDisplayLogic?

    func presentError(with error: String) {
        viewController?.displayError(with: error)
    }
    
    func presentUnFavoritedPeople(detail: PeopleResult) {
        let peopleDetail = transform(with: detail)
        let viewModel = DetailPeopleWidgetViewModel(
            items: [
                .favoriteCell(FavoritePeopleListCell.ViewModel(isFavorite: false)),
                .detailCell(peopleDetail)
            ]
        )
        viewController?.displayPeopleDetail(model: viewModel)
    }
    
    func presentFavoritedPeople(detail: PeopleResult) {
        let peopleDetail = transform(with: detail)
        let viewModel = DetailPeopleWidgetViewModel(
            items: [
                .favoriteCell(FavoritePeopleListCell.ViewModel(isFavorite: true)),
                .detailCell(peopleDetail)
            ]
        )
        viewController?.displayPeopleDetail(model: viewModel)
    }
    
    func transform(with people: PeopleResult) -> [DetailPeopleListCell.ViewModel] {
        let mirroredObject = Mirror(reflecting: people)
        var viewModel: [DetailPeopleListCell.ViewModel] = []
        for (_, attr) in mirroredObject.children.enumerated() {
            if let title: String = attr.label, var subtitle = attr.value as? String {
                if title == "created" || title == "edited" {
                    subtitle = Date.getFormattedDate(string: subtitle)
                }
                
                viewModel.append(
                    DetailPeopleListCell.ViewModel(
                        title: title.uppercased(),
                        subtitle: subtitle.capitalized
                    )
                )
            }
        }
        return viewModel
    }
}
