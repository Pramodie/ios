//
//  FinalProjectUITests.swift
//  FinalProjectUITests
//
//  Created by pramodie athauda on 3/19/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import XCTest

class FinalProjectUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
   
    
    func testValidLogin()
    {
        
        let validUserName = "nikon@gmail.com"
        let validPassword = "nikons"
        
        let app = XCUIApplication()
        let UserNameTextField = app.textFields["User name"]
        UserNameTextField.tap()
        XCTAssertTrue(UserNameTextField.exists)
       UserNameTextField.typeText(validUserName)
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)
        //passwordSecureTextField.typeText(validPassword)
        
        app.buttons["LOGIN"].tap()
        
        //let app = XCUIApplication()
        //app.textFields["User name"].tap()
        
        //let passwordSecureTextField = app.secureTextFields["Password"]
       // passwordSecureTextField.tap()
        
        //passwordSecureTextField.tap()
        //app.buttons["LOGIN"].tap()
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: passwordSecureTextField, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        //XCUIApplication().statusBars.children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()
        //XCUIApplication().textFields["User name"].tap()
        
       // defaults write com.apple.iphonesimulator ConnectHardwareKeyboard 0
        
        
    }
 
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
                            
        
        let app = XCUIApplication()
        app.textFields["User name"].tap()
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        app.buttons["LOGIN"].tap()
        let alert = app.alerts["Something went wrong"]
        XCTAssertTrue(alert.exists)
        alert.buttons["Ok"].tap()
    }

}
extension XCTestCase {
    
    func tapElementAndWaitForKeyboardToAppear(element: XCUIElement) {
        let keyboard = XCUIApplication().keyboards.element
        while (true) {
            element.tap()
            if keyboard.exists {
                break;
            }
            RunLoop.current.run(until: NSDate(timeIntervalSinceNow: 0.5) as Date)
        }
    }
}
