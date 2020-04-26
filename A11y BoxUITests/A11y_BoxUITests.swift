//
//  Developing_Inclusive_Mobile_AppsUITests.swift
//  A11y BoxUITests
//
//  Created by Rob Whitaker on 08/02/2020.
//  Copyright © 2020 RWAPP. All rights reserved.
//

import XCTest

class Developing_Inclusive_Mobile_AppsUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        app.launch()
    }

    func test_buttonAllButtons() {
        // Navigate to the screen you want to check
        XCUIApplication().tabBars.buttons["Tests"].tap()

        let buttons = app.buttons.allElementsBoundByIndex

        for button in buttons {
            check(button: button)
        }
    }

    // Listing 11-1
    func check(button: XCUIElement) {
        XCTAssert(button.frame.size.height >= 44)
        XCTAssert(button.frame.size.width >= 44)
        XCTAssertTrue(button.label.count <= 40)
        XCTAssert(button.label.first!.isUppercase)
    }

    // Listing 11-2
    func test_imageName() {
        // Navigate to the screen you want to check
        XCUIApplication().tabBars.buttons["Tests"].tap()

        let images = app.images.allElementsBoundByIndex

        for image in images {
            XCTAssertFalse(image.label.contains("image"))
        }
    }
}
