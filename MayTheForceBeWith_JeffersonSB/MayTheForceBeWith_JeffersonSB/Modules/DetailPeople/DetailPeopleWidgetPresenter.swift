//
//  DetailPeoplePresenter.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

protocol DetailPeopleWidgetPresentationLogic {
    func presentPeopleDetail(detail: PeopleResult)
    func presentError(with error: String)
}

/// Responsible for displaying the module information PeopleWidget
final class DetailPeopleWidgetPresenter: DetailPeopleWidgetPresentationLogic {
    weak var viewController: DetailPeopleWidgetDisplayLogic?

    func presentError(with error: String) {
        viewController?.displayError(with: error)
    }
    
    func presentPeopleDetail(detail: PeopleResult) {
        let peopleDetail = transform(with: detail)
        viewController?.displayPeopleDetail(model: peopleDetail)
    }
    
    func transform(with people: PeopleResult) -> [DetailPeopleListCell.ViewModel] {
        let mirroredObject = Mirror(reflecting: people)
        var viewModel: [DetailPeopleListCell.ViewModel] = []
        for (_, attr) in mirroredObject.children.enumerated() {
            if let title: String = attr.label, let subtitle = attr.value as? String {
                viewModel.append(
                    DetailPeopleListCell.ViewModel(
                        title: title.uppercased(),
                        subtitle: subtitle
                    )
                )
            }
        }
        return viewModel
    }
}
