//
//  HTTPMethodTests.swift
//  CryptoDemoTests
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import XCTest
@testable import CryptoDemo

final class HTTPMethodTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testHTTPMethod_whenHTTPMethodIsGet_rawValueIsGet() {
        // Given
        let get = HTTPMethod.GET
        
        // When
        let sut = get.rawValue
        
        // Then
        XCTAssertEqual(sut, "GET")
    }
    
    func testHTTPMethod_whenHTTPMethodIsPost_rawValueIsPost() {
        // Given
        let post = HTTPMethod.POST
        
        // When
        let sut = post.rawValue
        
        // Then
        XCTAssertEqual(sut, "POST")
    }
    
    func testHTTPMethod_whenHTTPMethodIsPut_rawValueIsPut() {
        // Given
        let put = HTTPMethod.PUT
        
        // When
        let sut = put.rawValue
        
        // Then
        XCTAssertEqual(sut, "PUT")
    }
    
    func testHTTPMethod_whenHTTPMethodIsDelete_rawValueIsDelete() {
        // Given
        let delete = HTTPMethod.DELETE
        
        // When
        let sut = delete.rawValue
        
        // Then
        XCTAssertEqual(sut, "DELETE")
    }

}
