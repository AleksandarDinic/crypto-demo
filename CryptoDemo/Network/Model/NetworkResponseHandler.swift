//
//  NetworkResponseHandler.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol NetworkResponseHandler {
    
    func handle(_ result: Result<NetworkResponse, Error>, successStatuses: Set<HTTPStatusCode>) -> Result<Data, Error>
    
}

extension NetworkResponseHandler {
    
    func handle(_ result: Result<NetworkResponse, Error>, successStatuses: Set<HTTPStatusCode>) -> Result<Data, Error> {
        switch result {
        case let .success(networkResponse):
            guard successStatuses.contains(networkResponse.statusCode) else {
                return .failure(handleNetworkError(networkResponse))
            }

            guard let data = networkResponse.data else {
                return .failure(NetworkError.missingData)
            }
            return .success(data)
            
        case let .failure(error):
            return .failure(error)
        }
    }
    
    private func handleNetworkError(_ response: NetworkResponse) -> NetworkError {
        guard
            let data = response.data,
            let errorResponse = try? JSONDecoder().decode(NetworkErrorResponse.self, from: data)
        else {
            return NetworkError(for: response.statusCode, message: nil)
        }
        
        return NetworkError(for: response.statusCode, message: errorResponse.error)
    }
    
}
