//
//  MayTheForceBeWith_JeffersonSBUITests.swift
//  MayTheForceBeWith_JeffersonSBUITests
//
//  Created by Jefferson Batista on 13/01/2020.
//  Copyright © 2020 Jefferson S Batista. All rights reserved.
//

import XCTest

class MayTheForceBeWith_JeffersonSBUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app.collectionViews.cells.otherElements.containing(.staticText, identifier:"Obi-Wan Kenobi").element.swipeUp()
        
        let maytheforcebewithJeffNavigationBar = app.navigationBars["MayTheForceBeWith Jeff"]
        let searchSearchField = maytheforcebewithJeffNavigationBar.searchFields["Search"]
        searchSearchField.tap()
        maytheforcebewithJeffNavigationBar.buttons["Cancel"].tap()
        
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
}
