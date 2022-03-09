//
//  CoinAPIWrapper.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

struct CoinAPIWrapper: DecoderService {

    private let apiService: CoinAPIService

    init(apiService: CoinAPIService) {
        self.apiService = apiService
    }

    func getCoins(
        currency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        onComplete complete: @escaping (Result<[Coin], Error>) -> Void
    ) {
        apiService.getCoins(
            currency: currency,
            order: order,
            perPage: perPage,
            page: page,
            sparkline: sparkline
        ) { result in
            switch result {
            case let .success(data):
                complete(decode(from: data))

            case let .failure(error):
                complete(.failure(error))
            }
        }
    }
    
}
