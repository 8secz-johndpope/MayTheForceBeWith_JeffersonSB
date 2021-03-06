//
//  PeopleWidgetInteractor.swift
//  MayTheForceBeWith_JeffersonSB
//
//  Created by Jefferson Batista on 11/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import Foundation

protocol PeopleWidgetBusinessLogic {
    func fechPeople()
    func loadMore()
    func searchPeople(name: String)
    func segueDetail(url: String)
}

final class PeopleWidgetInteractor: PeopleWidgetBusinessLogic {
    let presenter: PeopleWidgetPresentationLogic
    let provider: PeopleProviderProtocol
    var searchText: String?
    var canLoadMore = false
    var cachedPeople: [PeopleResult] = []
    private var currentPage = 1

    init(
        presenter: PeopleWidgetPresentationLogic,
        provider: PeopleProviderProtocol
    ) {
        self.presenter = presenter
        self.provider = provider

    }
    
    func fechPeople() {
        provider.fechPeople(success: { [weak self] response in
            self?.cachedPeople = response.results
            self?.canLoadMore = !response.next.isEmpty
            self?.presenter.presentPeoples(response: response.results)
        }, failure: { error in
            self.canLoadMore = false
            self.presenter.presentError(with: error)
        })
    }
    
    func loadMore() {
        guard canLoadMore else {
            self.presenter.presentStopLoad()
            return
        }
        canLoadMore = false
        currentPage += 1
        provider.loadMore(page: currentPage, success: { [weak self] response in
            self?.canLoadMore = !response.next.isEmpty
            self?.cachedPeople += response.results
            guard let peoples = self?.cachedPeople else { return }
            self?.presenter.presentPeoples(response: peoples)
        }, failure: { error in
            self.presenter.presentStopLoad()
        })
    }
    
    func searchPeople(name: String) {
        guard !cachedPeople.isEmpty else {
            return
        }
        let peoples = cachedPeople
        let text = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard text.isEmpty == false else {
            searchText = nil
            self.presenter.presentPeoples(response: peoples)
            return
        }
        searchText = text
        let result = searchInPeople(peoples, with: text)
        self.presenter.presentPeoples(response: result)
    }
    
    private func searchInPeople(_ peoples: [PeopleResult], with text: String) -> [PeopleResult] {
        let text = text.lowercased()
        let predicate = NSPredicate(format: "SELF BEGINSWITH[cd] %@", text)
        let filtered = peoples.filter {
            let name = $0.name.lowercased()
            let nameParts = name.lowercased().components(separatedBy: .whitespaces)
            return nameParts.contains { predicate.evaluate(with: $0) } || name.hasPrefix(text)
        }
        return filtered
    }
    
    func segueDetail(url: String) {
        guard let peopleDetail = cachedPeople.filter({$0.url == url}).first else {
            return
        }
        let controller = Router.detailViewController(peopleDetail: peopleDetail)
        presenter.presentDetail(controller: controller)
    }
}
