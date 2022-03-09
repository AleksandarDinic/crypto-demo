//
//  CoinAPIWrapperFactory.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol CoinAPIWrapperFactory {

    var coinAPIService: CoinAPIService { get }

    func makeCoinAPIWrapper() -> CoinAPIWrapper

}

extension CoinAPIWrapperFactory {

    func makeCoinAPIWrapper() -> CoinAPIWrapper {
        CoinAPIWrapper(apiService: coinAPIService)
    }

}
