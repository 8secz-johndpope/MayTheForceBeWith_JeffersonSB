//
//  DetailPeoplePresenterMock.swift
//  MayTheForceBeWith_JeffersonSBTests
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import XCTest
@testable import MayTheForceBeWith_JeffersonSB

class DetailPeoplePresenterMock: DetailPeopleWidgetPresentationLogic {

    var presentUnFavoritedPeople = false
    var presentFavoritedPeople = false
    var presentError = false
    
    func presentUnFavoritedPeople(detail: PeopleResult) {
        presentUnFavoritedPeople = true
    }
    
    func presentFavoritedPeople(detail: PeopleResult) {
        presentFavoritedPeople = true
    }
    
    func presentError(with error: String) {
        presentError = true
    }
}
