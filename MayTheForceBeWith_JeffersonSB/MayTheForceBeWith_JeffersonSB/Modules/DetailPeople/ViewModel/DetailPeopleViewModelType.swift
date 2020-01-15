//
//  DetailPeopleViewModelType.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import IGListKit

enum DetailPeopleViewModelType {
    case favoriteCell(FavoritePeopleListCell.ViewModel)
    case detailCell([DetailPeopleListCell.ViewModel])

    func diffable() -> [ListDiffable] {
        switch self {
        case let .favoriteCell(value):
            return [value] as [ListDiffable]
        case let .detailCell(value):
            return value as [ListDiffable]
        }
    }
}

struct DetailPeopleWidgetViewModel {
    let items: [DetailPeopleViewModelType]
}
