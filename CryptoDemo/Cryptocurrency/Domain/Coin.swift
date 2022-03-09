//
//  Coin.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

struct Coin: Codable {
    
    let id: String
    let symbol: String
    let name: String
    let currentPrice: Double
    let image: String?
    let priceChangePercentage24h: Double?
    let marketCap: Int?
    let high24h: Double?
    let low24h: Double?
    let circulatingSupply: Int?
    let totalSupply: Int?
    let maxSupply: Int?
    let ath: Double?
    
}
