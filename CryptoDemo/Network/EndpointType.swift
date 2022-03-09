//
//  EndpointType.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/08/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol EndpointType {
    
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var body: Data? { get }
    var queryParameters: [String: String]? { get }
    var headers: [String: String]? { get }
    
}
