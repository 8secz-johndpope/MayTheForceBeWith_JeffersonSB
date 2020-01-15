//
//  FavoritePeopleSectionController.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import IGListKit

class FavoritePeopleSectionController: ListSectionController {
    private var viewModel: FavoritePeopleListCell.ViewModel?
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
                of: FavoritePeopleListCell.self,
                for: self, at: index
            ) as? FavoritePeopleListCell,
            let viewModel = viewModel
        else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModel)
        cell.onClickAction = { [weak self] in
            guard let self = self else { return }
            if viewModel.isFavorite {
                
            }
            self.interactor.doFavorite(isFavorite: viewModel.isFavorite)
        }

        return cell
    }

    override func didUpdate(to object: Any) {
        viewModel = object as? FavoritePeopleListCell.ViewModel
    }
}

