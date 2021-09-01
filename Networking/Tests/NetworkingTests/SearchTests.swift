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
    
    private var requestResponse: URLResponse?
    private var requestError: Error?
    
    func testSearch() {
        let expectation = expectation(description: "app.search.result")
        
        SignIn().userAuthentication { success, error in
            
            guard error == nil
            else {
                self.fulfill(
                    expectation: expectation,
                    response: nil,
                    error: error
                )
                return
            }
            
            SearchResource().searchEnterprise(text: Search(enterpriseSearched: "")) { _, response, error in
                self.fulfill(
                    expectation: expectation,
                    response: response,
                    error: error
                )
            }
        }

        waitForExpectations(timeout: 30)
        
        XCTAssertNotNil(self.requestResponse)
        XCTAssertNil(self.requestError)
    }
    
    func fulfill(expectation: XCTestExpectation, response: URLResponse?, error: Error?) {
        requestResponse = response
        requestError = error
        
        expectation.fulfill()
    }
}
