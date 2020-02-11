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
 
    var peoplesPresent = false
    var errorPresent = false
    var detailPresent = false
    var stopLoadPresent = false
    
    func presentPeoples(response: [PeopleResult]) {
        peoplesPresent = true
    }
    
    func presentError(with error: String) {
        errorPresent = true
    }
    
    func presentDetail(controller: UIViewController) {
        detailPresent = true
    }
    
    func presentStopLoad() {
        stopLoadPresent = true
    }
}
