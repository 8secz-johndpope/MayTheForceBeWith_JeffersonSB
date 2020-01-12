//
//  PeopleSectionController.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 12/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import IGListKit

class PeopleSectionController: ListSectionController {
    private var viewModel: PeopleListCell.ViewModel?
    let interactor: PeopleWidgetBusinessLogic

    init(interactor: PeopleWidgetBusinessLogic) {
        self.interactor = interactor
    }

    override func sizeForItem(at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else {
            return .zero
        }
        return CGSize(width: width, height: 60)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard
            let cell = collectionContext?.dequeueReusableCell(
                of: PeopleListCell.self,
                for: self, at: index
            ) as? PeopleListCell,
            let viewModel = viewModel
        else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModel)

        return cell
    }

    override func didUpdate(to object: Any) {
        viewModel = object as? PeopleListCell.ViewModel
    }
}

