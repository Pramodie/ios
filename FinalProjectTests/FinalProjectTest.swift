//
//  FinalProjectTest.swift
//  FinalProjectTests
//
//  Created by pramodie athauda on 3/19/20.
//  Copyright © 2020 pramodie athauda. All rights reserved.
//

import Foundation
import XCTest


@testable import FinalProjectTests
class FinalProjectTest: XCTest{
    let userName : String
    let password : String
    
    init(userName : String, password : String) {
        self.userName = userName
        self.password = password
    }
    func validUserName() -> Bool {
        return userName.count > 3
    }
    func validPassword() -> Bool{
        return password.count > 3
    }
    
   
    
    func testValidUserName(){
        let usera = (userName: "nikon@gmail.com", password :"nikons")
        XCTAssertFalse(validUserName())
    }
    func testValidatePassword(){
        let userb = (userName: "nikon@gmail.com", password :"nikons")
        XCTAssertTrue(validPassword())
    }
}
