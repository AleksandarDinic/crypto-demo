//
//  HTTPStatusCode.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/08/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

enum HTTPStatusCode: Int {
    
    case undefined = -1
    
    case ok = 200
    case noContent = 204
    
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404

    case internalServerError = 500
    
}
