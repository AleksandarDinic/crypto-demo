//
//  CoinRepositoryFactory.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol CoinRepositoryFactory: CoinDataProviderFactory {

    func makeCoinRepository() -> CoinRepository

}

extension CoinRepositoryFactory {

    func makeCoinRepository() -> CoinRepository {
        CoinRepository(dataProvider: makeCoinDataProvider())
    }

}
