//
//  DetailPeopleWidgetInteractorTests.swift
//  MayTheForceBeWith_JeffersonSBTests
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import XCTest

import XCTest
@testable import MayTheForceBeWith_JeffersonSB

class DetailPeopleWidgetInteractorTests: XCTestCase {
    var interactor: DetailPeopleWidgetInteractor!
    var presenter: DetailPeoplePresenterMock!
    var provider: DetailPeopleProviderMock!
    
    override func setUp() {
        presenter = DetailPeoplePresenterMock()
        provider = DetailPeopleProviderMock()
        
        interactor = DetailPeopleWidgetInteractor(
            presenter: presenter,
            provider: provider
        )
        
        interactor.cachedDetail = PeopleResult(
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
            url: "https://swapi.co/api/people/1/"
        )
    }

    override func tearDown() {
        presenter.presentUnFavoritedPeople = false
        presenter.presentFavoritedPeople = false
        presenter.presentError = false
        interactor.cachedDetail = nil
    }

    func testInteractorDoFavorite() {
        provider.testErrors(with: false)
        interactor.doFavorite(isFavorite: true)
        XCTAssertTrue(presenter.presentUnFavoritedPeople)
    }
    
    func testInteractorUnFavoritedPeople() {
        provider.testErrors(with: false)
        interactor.doFavorite(isFavorite: false)
        XCTAssertTrue(presenter.presentFavoritedPeople)
    }
    
    func testInteractorDoFavoriteFailure() {
        provider.testErrors(with: true)
        interactor.doFavorite(isFavorite: true)
        XCTAssertTrue(presenter.presentError)
    }
}
