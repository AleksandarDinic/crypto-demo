//
//  CoinCacheService.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol CoinCacheService {
    
    func getCoins(
        currency: String,
        order: String,
        perPage: Int,
        page: Int
    ) -> [Coin]?

    func saveCoins(_ coins: [Coin], currency: String)
    
}
