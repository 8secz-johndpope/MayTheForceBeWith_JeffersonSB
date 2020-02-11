//
//  PeopleSectionController.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 12/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import IGListKit

class DetailPeopleSectionController: ListSectionController {
    private var viewModel: DetailPeopleListCell.ViewModel?
    let interactor: DetailPeopleWidgetBusinessLogic

    init(interactor: DetailPeopleWidgetBusinessLogic) {
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
                of: DetailPeopleListCell.self,
                for: self, at: index
            ) as? DetailPeopleListCell,
            let viewModel = viewModel
        else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModel)

        return cell
    }

    override func didUpdate(to object: Any) {
        viewModel = object as? DetailPeopleListCell.ViewModel
    }
}

