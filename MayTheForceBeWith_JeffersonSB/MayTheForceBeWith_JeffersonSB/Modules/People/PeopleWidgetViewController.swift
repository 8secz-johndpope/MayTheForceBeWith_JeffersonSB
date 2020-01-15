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
    func displayError(with error: String)
    func displayStopLoad()
    func displayDetail(viewController: UIViewController)
}

final class PeopleWidgetViewController: UIViewController {
    let interactor: PeopleWidgetBusinessLogic
    private var viewModel: [PeopleListCell.ViewModel]?
    private var searchTask: DispatchWorkItem?
    private var isLoading = false
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
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
        interactor.fechPeople()
        startLoading()
        showSearchBar()
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
    
    private func showAlert(with error: String) {
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    public func startLoading() {
        isLoading = true
        contentView.activityIndicator.startLoading()
    }

    public func stopLoading() {
        isLoading = false
        contentView.activityIndicator.stopLoading()
    }
}

extension PeopleWidgetViewController: PeopleWidgetDisplayLogic {
    func displayError(with error: String) {
        stopLoading()
        showAlert(with: error)
    }
    
    func displayPeople(presentResult: [PeopleListCell.ViewModel]) {
        stopLoading()
        viewModel = presentResult
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    func displayDetail(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func displayStopLoad() {
        stopLoading()
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
        if scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)
            && !isLoading {
            // reach bottom
            startLoading()
            interactor.loadMore()
            return
        }
    }
}
