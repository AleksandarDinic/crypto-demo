//
//  DecoderService.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/09/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

protocol DecoderService {
    
    func decode<T: Codable>(from data: Data) -> Result<T, Error>
    
}

extension DecoderService {
    
    func decode<T: Codable>(from data: Data) -> Result<T, Error> {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
    
}
