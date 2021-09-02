//
//  LoginTests.swift
//  
//
//  Created by Mayara Ferreira de Oliveira on 27/08/21.
//

import XCTest
import Domain

@testable import Networking

class LoginTests: XCTestCase {
    
    func testLogin() {
        let expectation = expectation(description: "app.login.result")
        var requestResponse: URLResponse?
        var requestError: Error?
        
        let loginData = Login(email: "", password: "")
        
        LoginResource().login(order: loginData) {_, response, error in
            requestResponse = response
            requestError = error
            
            expectation.fulfill()
        }

        waitForExpectations(timeout: 30)
        
        XCTAssertNotNil(requestResponse)
        XCTAssertNil(requestError)
    }
}
