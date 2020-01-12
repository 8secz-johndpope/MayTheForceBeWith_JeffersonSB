//
//  PeopleListViewModel.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 12/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation
import IGListKit

struct PeopleListViewModel {
    static let empty = PeopleListViewModel(sections: [])
    let sections: [PeopleListSectionViewModel]
}

struct PeopleListSectionViewModel: Diffable {
    let title: String
    let items: [PeopleListCell.ViewModel]

    var diffIdentifier: String { return title }
    static func == (lhs: PeopleListSectionViewModel, rhs: PeopleListSectionViewModel) -> Bool {
        return lhs.title == rhs.title
    }
}

