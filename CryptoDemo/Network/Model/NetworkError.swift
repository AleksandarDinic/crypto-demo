//
//  NetworkError.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/08/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    
    case undefined(_ message: String?)
    
    case missingData
    case invalidResponse
    
    case noContent(_ message: String?)
    case badRequest(_ message: String?)
    case unauthorized(_ message: String?)
    case forbidden(_ message: String?)
    case notFound(_ message: String?)
    
    case internalServerError
    
}

extension NetworkError {
    
    init(for statusCode: HTTPStatusCode, message: String?) {
        switch statusCode {
        case .noContent:
            self = .noContent(message)
        case .badRequest:
            self = .badRequest(message)
        case .unauthorized:
            self = .unauthorized(message)
        case .forbidden:
            self = .forbidden(message)
        case .notFound:
            self = .notFound(message)
        case .internalServerError:
            self = .internalServerError
        default:
            self = .undefined(message)
        }
    }
    
}
