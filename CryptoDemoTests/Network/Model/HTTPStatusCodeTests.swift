//
//  HTTPStatusCodeTests.swift
//  CryptoDemoTests
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import XCTest
@testable import CryptoDemo

final class HTTPStatusCodeTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testHTTPStatusCode_whenHTTPStatusCodeIsUndefined_rawValueIsMinus1() {
        // Given
        let undefined = HTTPStatusCode.undefined
        
        // When
        let sut = undefined.rawValue
        
        // Then
        XCTAssertEqual(sut, -1)
    }
    
    func testHTTPStatusCode_whenHTTPStatusCodeIsOk_rawValueIs200() {
        // Given
        let ok = HTTPStatusCode.ok
        
        // When
        let sut = ok.rawValue
        
        // Then
        XCTAssertEqual(sut, 200)
    }
    
    func testHTTPStatusCode_whenHTTPStatusCodeIsNoContent_rawValueIs204() {
        // Given
        let noContent = HTTPStatusCode.noContent
        
        // When
        let sut = noContent.rawValue
        
        // Then
        XCTAssertEqual(sut, 204)
    }

    func testHTTPStatusCode_whenHTTPStatusCodeIsBadRequest_rawValueIs400() {
        // Given
        let badRequest = HTTPStatusCode.badRequest
        
        // When
        let sut = badRequest.rawValue
        
        // Then
        XCTAssertEqual(sut, 400)
    }

    func testHTTPStatusCode_whenHTTPStatusCodeIsUnauthorized_rawValueIs401() {
        // Given
        let unauthorized = HTTPStatusCode.unauthorized
        
        // When
        let sut = unauthorized.rawValue
        
        // Then
        XCTAssertEqual(sut, 401)
    }

    func testHTTPStatusCode_whenHTTPStatusCodeIsForbidden_rawValueIs403() {
        // Given
        let forbidden = HTTPStatusCode.forbidden
        
        // When
        let sut = forbidden.rawValue
        
        // Then
        XCTAssertEqual(sut, 403)
    }

    func testHTTPStatusCode_whenHTTPStatusCodeIsNotFound_rawValueIs404() {
        // Given
        let notFound = HTTPStatusCode.notFound
        
        // When
        let sut = notFound.rawValue
        
        // Then
        XCTAssertEqual(sut, 404)
    }

    func testHTTPStatusCode_whenHTTPStatusCodeIsInternalServerError_rawValueIs500() {
        // Given
        let internalServerError = HTTPStatusCode.internalServerError
        
        // When
        let sut = internalServerError.rawValue
        
        // Then
        XCTAssertEqual(sut, 500)
    }
}
