//
//  CoinDataProviderFactory.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol CoinDataProviderFactory: CoinAPIWrapperFactory {

    var coinCacheService: CoinCacheService { get }

    func makeCoinDataProvider() -> CoinDataProvider

}

extension CoinDataProviderFactory {

    func makeCoinDataProvider() -> CoinDataProvider {
        CoinDataProvider(
            apiWrapper: makeCoinAPIWrapper(),
            cacheService: coinCacheService
        )
    }

}
