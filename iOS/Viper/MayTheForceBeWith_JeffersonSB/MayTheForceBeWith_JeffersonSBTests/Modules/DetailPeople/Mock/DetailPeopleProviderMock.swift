//
//  DetailPeopleProviderMock.swift
//  MayTheForceBeWith_JeffersonSBTests
//
//  Created by Jefferson Batista on 14/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import XCTest
@testable import MayTheForceBeWith_JeffersonSB

class DetailPeopleProviderMock: NSObject, DetailPeopleProviderProtocol {
    private var shouldValidadeError = false

    func favoritePeople(success: @escaping FavoriteSuccess, failure: @escaping FavoriteError) {
        if !shouldValidadeError {
            success(true)
        } else {
            failure("Error")
        }
    }
    
    func testErrors(with param: Bool) {
        shouldValidadeError = param
    }
}
