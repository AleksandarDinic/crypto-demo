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

#if DEBUG
extension Coin {
    
    static func make(
        id: String = UUID().uuidString,
        symbol: String = UUID().uuidString,
        name: String = UUID().uuidString,
        currentPrice: Double = Double.random(in: 10.0 ..< 100_000.0),
        image: String? = nil,
        priceChangePercentage24h: Double? = nil,
        marketCap: Int? = nil,
        high24h: Double? = nil,
        low24h: Double? = nil,
        circulatingSupply: Int? = nil,
        totalSupply: Int? = nil,
        maxSupply: Int? = nil,
        ath: Double? = nil
    ) -> Coin {
        self.init(
            id: id,
            symbol: symbol,
            name: name,
            currentPrice: currentPrice,
            image: image,
            priceChangePercentage24h: priceChangePercentage24h,
            marketCap: marketCap,
            high24h: high24h,
            low24h: low24h,
            circulatingSupply: circulatingSupply,
            totalSupply: totalSupply,
            maxSupply: maxSupply,
            ath: ath
        )
    }
    
}
#endif
