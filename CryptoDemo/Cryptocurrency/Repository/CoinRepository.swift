//
//  CoinRepository.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

final class CoinRepository {
    
    private let dataProvider: CoinDataProvider

    init(dataProvider: CoinDataProvider) {
        self.dataProvider = dataProvider
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
        dataProvider.getCoins(
            currency: currency,
            order: order,
            perPage: perPage,
            page: page,
            sparkline: sparkline,
            fromDataSource: dataSource,
            onComplete: complete
        )
    }
    
}
