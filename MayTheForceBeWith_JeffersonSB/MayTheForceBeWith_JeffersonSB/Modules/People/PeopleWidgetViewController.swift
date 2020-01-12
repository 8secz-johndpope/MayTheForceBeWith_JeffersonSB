//
//  PeopleWidgetViewController.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import UIKit
import IGListKit

protocol PeopleWidgetDisplayLogic: AnyObject {
    func displayPeople(presentResult: [PeopleListCell.ViewModel])
}

final class PeopleWidgetViewController: UIViewController {
    let interactor: PeopleWidgetBusinessLogic
    private var viewModel: [PeopleListCell.ViewModel]?
    private var searchTask: DispatchWorkItem?
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.barStyle = .black
        return searchController
    }()
    
    lazy var contentView = PeopleListView(frame: UIScreen.main.bounds)
    lazy var adapter: ListAdapter = {
        ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    init(
        interactor: PeopleWidgetBusinessLogic
    ) {
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
        searchController.searchResultsUpdater = self
        adapter.collectionView = contentView.collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
        showSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.fechPeople()
    }
    
    private func showSearchBar() {
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
        } else {
            navigationItem.titleView = searchController.searchBar
        }
    }
}

extension PeopleWidgetViewController: PeopleWidgetDisplayLogic {
    func displayPeople(presentResult: [PeopleListCell.ViewModel]) {
        viewModel = presentResult
        adapter.performUpdates(animated: true, completion: nil)
    }
}

extension PeopleWidgetViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchTask?.cancel()
        let text = searchController.searchBar.text ?? ""
        let task = DispatchWorkItem { [weak self] in
            self?.interactor.searchPeople(name: text)
        }

        DispatchQueue.main.asyncAfter(deadline: .now(), execute: task)
    }
}

extension PeopleWidgetViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let viewModel = viewModel else { return [] }
        return viewModel as [ListDiffable]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return PeopleSectionController(interactor: interactor)
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension PeopleWidgetViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height) {
            // reach bottom
            interactor.loadMore()
            return
        }
    }
}
