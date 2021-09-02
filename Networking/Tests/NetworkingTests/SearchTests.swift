//
//  SearchTests.swift
//  
//
//  Created by Mayara Ferreira de Oliveira on 31/08/21.
//

import XCTest
import UIKit
import Domain

@testable import Networking

class SearchTests: XCTestCase {
    
    func testSearch() {
        let expectation = expectation(description: "app.search.result")
        var requestResponse: URLResponse?
        var requestError: Error?
        
        SignIn().userAuthentication { success, error in
            
            if success {
                SearchResource().searchEnterprise(text: Search(enterpriseSearched: "")) { _, response, error in
                    
                    requestResponse = response
                    requestError = error
                    expectation.fulfill()
                }
            } else {
                requestError = error
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 30)
        
        XCTAssertNotNil(requestResponse)
        XCTAssertNil(requestError)
    }
}
