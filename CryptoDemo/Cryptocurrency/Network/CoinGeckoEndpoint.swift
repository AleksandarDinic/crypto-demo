//
//  CoinGeckoEndpoint.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

enum CoinGeckoEndpoint: EndpointType {
    
    case getCoinsMarketData(currency: String, order: String, perPage: Int, page: Int, sparkline: Bool)
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.coingecko.com/api/v3") else {
            fatalError("😱 CoinGecko base URL is invalid")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .getCoinsMarketData:
            return "/coins/markets"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getCoinsMarketData:
            return .GET
        }
    }
    
    var body: Data? {
        nil
    }
    
    var queryParameters: [String: String]? {
        switch self {
        case let .getCoinsMarketData(currency, order, perPage, page, sparkline):
            return [
                "vs_currency": currency,
                "order": order,
                "per_page": "\(perPage)",
                "page": "\(page)",
                "sparkline": "\(sparkline)"
            ]
        }
    }
    
    var headers: [String: String]? {
        nil
    }
    
}
