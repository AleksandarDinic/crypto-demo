//
//  CoinGeckoEndpointTests.swift
//  CryptoDemoTests
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import XCTest
@testable import CryptoDemo

final class CoinGeckoEndpointTests: XCTestCase {
    
    private var currency: String!
    private var order: String!
    private var perPage: Int!
    private var page: Int!
    private var sparkline: Bool!
    private var sut: CoinGeckoEndpoint!
    

    override func setUpWithError() throws {
        currency = "usd"
        order = "market_cap_desc"
        perPage = 100
        page = 1
        sparkline = true
        sut = .getCoinsMarketData(
            currency: currency,
            order: order,
            perPage: perPage,
            page: page,
            sparkline: sparkline
        )
    }

    override func tearDownWithError() throws {
        currency = nil
        order = nil
        perPage = nil
        page = nil
        sparkline = nil
        sut = nil
    }
    
    func testBaseURL_whenEndpointIsGetCoinsMarketData_isEqualToGivenBaseURL() {
        // Given
        let givenBaseURL = URL(string: "https://api.coingecko.com/api/v3")

        // When
        let baseURL = sut.baseURL
        
        // Then
        XCTAssertEqual(baseURL, givenBaseURL)
    }

    func testPath_whenEndpointIsGetCoinsMarketData_isEqualToGivenPath() {
        // Given
        let givenPath = "/coins/markets"

        // When
        let path = sut.path
        
        // Then
        XCTAssertEqual(path, givenPath)
    }
    
    func testHTTPMethod_whenEndpointIsGetCoinsMarketData_isEqualToGet() {
        // Given
        let givenHTTPMethod = HTTPMethod.GET

        // When
        let httpMethod = sut.httpMethod
        
        // Then
        XCTAssertEqual(httpMethod.rawValue, givenHTTPMethod.rawValue)
    }
    
    func testBody_whenEndpointIsGetCoinsMarketData_bodyIsNil() {
        // Given

        // When
        let body = sut.body
        
        // Then
        XCTAssertNil(body)
    }
    
    func testQueryParameters_whenEndpointIsGetCoinsMarketData_isEqualToGivenQueryParameters() throws {
        // Given
        let perPage = try XCTUnwrap(String(perPage))
        let page = try XCTUnwrap(String(page))
        let sparkline = try XCTUnwrap(String(sparkline))

        // When
        let queryParameters = sut.queryParameters
        
        // Then
        let parameters = try XCTUnwrap(queryParameters)
        XCTAssertEqual(parameters["vs_currency"], currency)
        XCTAssertEqual(parameters["order"], order)
        XCTAssertEqual(parameters["per_page"], perPage)
        XCTAssertEqual(parameters["page"], page)
        XCTAssertEqual(parameters["sparkline"], sparkline)
    }
    
    func testHeaders_whenEndpointIsGetCoinsMarketData_headersIsNil() {
        // Given

        // When
        let headers = sut.headers
        
        // Then
        XCTAssertNil(headers)
    }

}
