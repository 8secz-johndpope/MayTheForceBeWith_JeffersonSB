//
//  PeoplePresenterMock.swift
//  MayTheForceBeWith_JeffersonSBTests
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import XCTest
@testable import MayTheForceBeWith_JeffersonSB

class PeoplePresenterMock: PeopleWidgetPresentationLogic {

    var presentPeoples = false
    var presentError = false
    var presentDetail = false
    
    func presentPeoples(response: [PeopleResult]) {
        presentPeoples = true
    }
    
    func presentError(with error: String) {
        presentError = true
    }
    
    func presentDetail(controller: UIViewController) {
        presentDetail = true
    }
}
