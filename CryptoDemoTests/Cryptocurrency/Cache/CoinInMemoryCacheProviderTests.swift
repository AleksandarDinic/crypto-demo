//
//  CoinInMemoryCacheProviderTests.swift
//  CryptoDemoTests
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import XCTest
@testable import CryptoDemo

final class CoinInMemoryCacheProviderTests: XCTestCase {
    
    private var order: String!
    private var currency: String!
    private var coins: [CoinInMemoryCacheProvider.CoinKey: Coin]!
    private var sut: CoinInMemoryCacheProvider!

    override func setUpWithError() throws {
        order = ""
        currency = "USD"
        coins = CoinInMemoryCacheProvider.makeCoins(count: 10, currency: currency)
        sut = CoinInMemoryCacheProvider(coins)
    }

    override func tearDownWithError() throws {
        order = nil
        currency = nil
        coins = nil
        sut = nil
    }
    
    func test_whenCoinsPerPageIs0_assertNil() {
        // Given

        // When
        let coins = sut.getCoins(currency: currency, order: order, perPage: 0, page: 0)
        
        // Then
        XCTAssertNil(coins)
    }
    
    func test_whenCoinsPerPageIsMinus1_assertNil() {
        // Given

        // When
        let coins = sut.getCoins(currency: currency, order: order, perPage: -1, page: 0)
        
        // Then
        XCTAssertNil(coins)
    }
    
    func test_whenPageIsMinus1_assertNil() {
        // Given

        // When
        let coins = sut.getCoins(currency: currency, order: order, perPage: 10, page: -1)
        
        // Then
        XCTAssertNil(coins)
    }
    
    func test_whenArrayIsOutOfRange_assertNil() {
        // Given

        // When
        let coins = sut.getCoins(currency: currency, order: order, perPage: 10, page: 1)
        
        // Then
        XCTAssertNil(coins)
    }
    
    func test_whenArrayIsInRange_returnsCoins() {
        // Given

        // When
        let coins = sut.getCoins(currency: currency, order: order, perPage: 5, page: 1)
        
        // Then
        XCTAssertEqual(coins?.count, 5)
    }

}
