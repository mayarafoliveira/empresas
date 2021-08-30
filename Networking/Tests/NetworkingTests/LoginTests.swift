//
//  LoginTests.swift
//  
//
//  Created by Mayara Ferreira de Oliveira on 27/08/21.
//

import XCTest

@testable import Networking
@testable import Domain

class LoginTests: XCTestCase {
    
    func testLogin() {
        let expectation = expectation(description: "app.login.result")
        var requestError: Error?
        var requestResponse: URLResponse?
        
        LoginResource().login(order: Login(email: "testeapple@ioasys.com.br", password: "12341234")) {_, response, error in
            requestResponse = response
            requestError = error
            
            expectation.fulfill()
        }

        waitForExpectations(timeout: 30)
        
        XCTAssertNotNil(requestResponse)
        XCTAssertNil(requestError)
    }
}
