//
//  UserTests.swift
//  
//
//  Created by Mayara Ferreira de Oliveira on 25/08/21.
//

import XCTest

@testable import Domain

class UserTests: XCTestCase {
    
    func testValidEmail() {
        let emailValidator = EmailValidator().validate(email: "teste@email.com")
        XCTAssertEqual(emailValidator, .valid)
    }
    
    func testInalidEmail() {
        let emailValidator = EmailValidator().validate(email: "teste@email")
        XCTAssertEqual(emailValidator, .invalid)
    }
    
    func testValidPassword() {
        let passwordValidator = PasswordValidator().validate(password: "12345678")
        XCTAssertEqual(passwordValidator, .valid)
    }
    
    func testInvalidPassword() {
        let passwordValidator = PasswordValidator().validate(password: "54321")
        XCTAssertEqual(passwordValidator, .invalid)
    }
}
