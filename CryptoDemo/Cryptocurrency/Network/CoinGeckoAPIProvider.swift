//
//  CoinGeckoAPIProvider.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

final class CoinGeckoAPIProvider: NetworkResponseHandler {
    
    private let session: URLSession
    private let networkManager: NetworkManager<CoinGeckoEndpoint>
    
    init(
        session: URLSession = .shared,
        networkManager: NetworkManager<CoinGeckoEndpoint> = NetworkManager<CoinGeckoEndpoint>()
    ) {
        self.session = session
        self.networkManager = networkManager
    }

    func getCoins(
        currency: String,
        order: String,
        perPage: Int,
        page: Int,
        sparkline: Bool,
        onComplete complete: @escaping (Result<Data, Error>) -> Void
    ) {
        networkManager.request(.getCoinsMarketData(
            currency: currency,
            order: order,
            perPage: perPage,
            page: page,
            sparkline: sparkline
        )) { [weak self] in
            guard let self = self else { return }
            complete(self.handle($0, successStatuses: [.ok]))
        }
    }

}
