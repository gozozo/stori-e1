//
//  storiUITests.swift
//  storiUITests
//
//  Created by Luis Enrique Vazquez Escobar on 17/11/24.
//

import XCTest

final class StoriUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAplication() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let table = app.tables["moviesTable"]
        XCTAssertTrue(table.exists, "The table view does not exist")

        let firstCell = table.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists, "The first cell does not exist")

        firstCell.tap()

        let movieOverviewLabel = app.staticTexts["movieOverview"]
        XCTAssertTrue(movieOverviewLabel.exists, "The movie overview label does not exist")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
