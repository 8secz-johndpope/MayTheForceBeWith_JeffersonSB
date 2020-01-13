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
    }

    override func tearDown() {
        presenter.presentPeoples = false
        presenter.presentError = false
    }

    func testInteractorFechPeopleSuccess() {
        provider.testErrors(with: false)
        interactor.fechPeople()
        XCTAssertTrue(presenter.presentPeoples)
    }
    
    func testInteractorLoadMoreSuccess() {
        provider.testErrors(with: false)
        interactor.canLoadMore = true
        interactor.loadMore()
        XCTAssertTrue(presenter.presentPeoples)
    }
    
    func testInteractorSegueDetaill() {
        provider.testErrors(with: false)
        interactor.segueDetail()
        XCTAssertTrue(presenter.presentDetail)
    }
    
    func testInteractorFechPeopleFailure() {
        provider.testErrors(with: true)
        interactor.fechPeople()
        XCTAssertTrue(presenter.presentError)
    }
    
    func testInteractorLoadMoreFailure() {
        provider.testErrors(with: true)
        interactor.canLoadMore = true
        interactor.loadMore()
        XCTAssertTrue(presenter.presentError)
    }

}
