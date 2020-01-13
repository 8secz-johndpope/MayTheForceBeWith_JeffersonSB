//
//  PeopleWidgetViewController.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit
import IGListKit

protocol DetailPeopleWidgetDisplayLogic: AnyObject {
    func displayPeopleDetail(model: [DetailPeopleListCell.ViewModel])
    func displayError(with error: String)
}

final class DetailPeopleWidgetViewController: UIViewController {
    let interactor: DetailPeopleWidgetBusinessLogic
    let peopleDetail: PeopleResult
    private var viewModel: [DetailPeopleListCell.ViewModel]?
    
    lazy var contentView = DetailPeopleListView(frame: UIScreen.main.bounds)
    
    lazy var adapter: ListAdapter = {
        ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    init(
        peopleDetail: PeopleResult,
        interactor: DetailPeopleWidgetBusinessLogic
    ) {
        self.peopleDetail = peopleDetail
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.collectionView = contentView.collectionView
        adapter.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fechPeopleDetail(detail: peopleDetail)
    }
    
    private func showAlert(with error: String) {
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension DetailPeopleWidgetViewController: DetailPeopleWidgetDisplayLogic {
    func displayPeopleDetail(model: [DetailPeopleListCell.ViewModel]) {
        viewModel = model
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    func displayError(with error: String) {
        showAlert(with: error)
    }
}

extension DetailPeopleWidgetViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let viewModel = viewModel else { return [] }
        return viewModel as [ListDiffable]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return DetailPeopleSectionController(interactor: interactor)
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
