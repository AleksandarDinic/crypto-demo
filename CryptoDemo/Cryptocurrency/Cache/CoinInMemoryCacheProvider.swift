//
//  CoinInMemoryCacheProvider.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

final class CoinInMemoryCacheProvider: CoinCacheService {
    
    private var coins: [CoinKey: Coin]
    private let coinLifetime: TimeInterval
    
    init(
        _ coins: [CoinKey: Coin] = [:],
        coinLifetime: TimeInterval = 5 * 60 // 5 minutes
    ) {
        self.coins = coins
        self.coinLifetime = coinLifetime
    }
    
    func getCoins(currency: String, order: String, perPage: Int, page: Int) -> [Coin]? {
        var ans = [Coin]()
        let now = Date.now

        for (key, val) in coins {
            guard now < key.expirationDate else {
                coins.removeValue(forKey: key)
                continue
            }
            guard key.currency == currency else {
                continue
            }
            ans.append(val)
        }
        // FIXME: - Sort by the given order
        ans.sort(by: { $0.marketCap ?? -1 > $1.marketCap ?? -1 })
        ans = pagination(ans, page: page, perPage: perPage)
        
        return !ans.isEmpty ? ans : nil
    }
    
    private func pagination(_ coins: [Coin], page: Int, perPage: Int) -> [Coin] {
        guard page >= 0, perPage > 0 else { return [] }

        let startIndex = page * perPage
        let length = min(perPage, max(0, coins.count - startIndex))

        guard length > 0 else { return [] }

        return Array(coins[startIndex..<(startIndex + length)])
    }
    
    func saveCoins(_ coins: [Coin], currency: String) {
        let date = Date.now.addingTimeInterval(coinLifetime)
        
        for coin in coins {
            let key = CoinKey(id: coin.id, currency: currency, expirationDate: date)
            self.coins[key] = coin
        }
    }

}

extension CoinInMemoryCacheProvider {
    
    struct CoinKey: Hashable {
        
        let id: String
        let currency: String
        let expirationDate: Date
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(currency)
        }

    }
    
}

#if DEBUG
extension CoinInMemoryCacheProvider {
    
    static func makeCoins(count: Int, currency: String) -> [CoinKey: Coin] {
        var coins = [Coin]()
        for _ in 0..<count {
            coins.append(Coin.make())
        }

        var ans = [CoinKey: Coin]()
        let date = Date.now.addingTimeInterval(5 * 60)
        
        for coin in coins {
            let key = CoinKey(id: coin.id, currency: currency, expirationDate: date)
            ans[key] = coin
        }
        
        return ans
    }
    
}
#endif
