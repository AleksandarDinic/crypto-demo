//
//  CoinDataProvider.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

struct CoinDataProvider {

    private let apiWrapper: CoinAPIWrapper
    private let cacheService: CoinCacheService

    init(
        apiWrapper: CoinAPIWrapper,
        cacheService: CoinCacheService
    ) {
        self.apiWrapper = apiWrapper
        self.cacheService = cacheService
    }
    
    func getCoins(
        currency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        fromDataSource dataSource: DataSourceLayer,
        onComplete complete: @escaping (Result<[Coin], Error>) -> Void
    ) {
        switch dataSource {
        case .memory:
            if let coinsFromMemory = getCoinsFromMemory(currency: currency, order: order, perPage: perPage, page: page) {
                return complete(.success(coinsFromMemory))
            }
            fallthrough
        case .network:
            getCoinsFromNetwork(
                currency: currency,
                order: order,
                perPage: perPage,
                page: page,
                sparkline: sparkline,
                onComplete: complete
            )
        }
    }
    
    private func getCoinsFromMemory(
        currency: String,
        order: String,
        perPage: Int,
        page: Int
    ) -> [Coin]? {
        cacheService.getCoins(
            currency: currency,
            order: order,
            perPage: perPage,
            page: page
        )
    }
    
    private func getCoinsFromNetwork(
        currency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        onComplete complete: @escaping (Result<[Coin], Error>) -> Void
    ) {
        apiWrapper.getCoins(
            currency: currency,
            order: order,
            perPage: perPage,
            page: page,
            sparkline: sparkline
        ) { result in
            switch result {
            case let .success(coins):
                cacheService.saveCoins(coins, currency: currency)
                complete(.success(coins))
            case let .failure(error):
                complete(.failure(error))
            }
        }
    }

}
