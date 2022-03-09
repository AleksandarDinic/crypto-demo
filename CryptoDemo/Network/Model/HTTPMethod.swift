//
//  HTTPMethod.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/08/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

struct HTTPMethod {

    static var GET: HTTPMethod { HTTPMethod(rawValue: "GET") }
    static var POST: HTTPMethod { HTTPMethod(rawValue: "POST") }
    static var PUT: HTTPMethod { HTTPMethod(rawValue: "PUT") }
    static var DELETE: HTTPMethod { HTTPMethod(rawValue: "DELETE") }

    let rawValue: String

}
