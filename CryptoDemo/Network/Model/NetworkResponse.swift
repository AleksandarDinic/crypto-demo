//
//  NetworkResponse.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/08/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

struct NetworkResponse {
    
    let statusCode: HTTPStatusCode
    let data: Data?
    
}

extension NetworkResponse {
    
    init(statusCode: Int, data: Data?) {
        self.statusCode = HTTPStatusCode(rawValue: statusCode) ?? .undefined
        self.data = data
    }
    
}
