//
//  PeopleProviderMock.swift
//  MayTheForceBeWith_JeffersonSBTests
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import XCTest
@testable import MayTheForceBeWith_JeffersonSB

class PeopleProviderMock: NSObject, ProviderPeople {
    private var shouldValidadeError = false
    
    func fechPeople(success: @escaping FetchPeopleSuccess, failure: @escaping PeopleError) {
        if !shouldValidadeError {
            success(PeopleModel(count: 1, next: "Jefferson", previous: "", results: []))
        } else {
            failure("Error")
        }
    }
    
    func loadMore(page: Int, success: @escaping FetchPeopleSuccess, failure: @escaping PeopleError) {
        if !shouldValidadeError {
            success(PeopleModel(count: 1, next: "Jefferson", previous: "", results: []))
        } else {
            failure("Error")
        }
    }
    
    func testErrors(with param: Bool) {
        shouldValidadeError = param
    }
}
