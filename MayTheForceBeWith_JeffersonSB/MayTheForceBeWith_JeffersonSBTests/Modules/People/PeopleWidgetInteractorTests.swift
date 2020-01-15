//
//  PeopleWidgetInteractorTests.swift
//  MayTheForceBeWith_JeffersonSBTests
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import XCTest
@testable import MayTheForceBeWith_JeffersonSB

class PeopleWidgetInteractorTests: XCTestCase {
    var interactor: PeopleWidgetInteractor!
    var presenter: PeoplePresenterMock!
    var provider: PeopleProviderMock!
    
    override func setUp() {
        presenter = PeoplePresenterMock()
        provider = PeopleProviderMock()
        
        interactor = PeopleWidgetInteractor(
            presenter: presenter,
            provider: provider
        )
        
        interactor.cachedPeople.append(PeopleResult(
            name: "Luke Skywalker",
            height: "172",
            mass: "77",
            hairColor: "blond",
            skinColor: "fair",
            eyeColor: "blue",
            birthYear: "19BBY",
            gender: "male",
            homeworld: "https://swapi.co/api/planets/1/",
            films: [],
            species: [],
            vehicles: [],
            starships: [],
            created: "2014-12-09T13:50:51.644000Z",
            edited: "2014-12-20T21:17:56.891000Z",
            url: "https://swapi.co/api/people/1/")
        )
    }

    override func tearDown() {
        presenter.peoplesPresent = false
        presenter.errorPresent = false
        presenter.detailPresent = false
        presenter.stopLoadPresent = false
    }

    func testInteractorFechPeopleSuccess() {
        provider.testErrors(with: false)
        interactor.fechPeople()
        XCTAssertTrue(presenter.peoplesPresent)
    }
    
    func testInteractorLoadMoreSuccess() {
        provider.testErrors(with: false)
        interactor.canLoadMore = true
        interactor.loadMore()
        XCTAssertTrue(presenter.peoplesPresent)
    }
    
    func testInteractorSegueDetaill() {
        provider.testErrors(with: false)
        
        interactor.segueDetail(url: "https://swapi.co/api/people/1/")
        XCTAssertTrue(presenter.detailPresent)
    }
    
    func testInteractorFechPeopleFailure() {
        provider.testErrors(with: true)
        interactor.fechPeople()
        XCTAssertTrue(presenter.errorPresent)
    }
    
    func testInteractorLoadMoreFailure() {
        provider.testErrors(with: true)
        interactor.canLoadMore = true
        interactor.loadMore()
        XCTAssertTrue(presenter.stopLoadPresent)
    }
}
