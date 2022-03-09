//
//  NetworkLogger.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/08/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation
import Logging

protocol NetworkLogger {
    
    func log(request: URLRequest)
    func log(data: Data?, response: URLResponse?, error: Error?)
    
}
    
extension NetworkLogger {

    func log(request: URLRequest) {
        let logger = Logger(label: "CryptoDemo")
        logger.info("\n - - - - - - - - - - OUTGOING - - - - - - - - - - \n")
        
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = URLComponents(string: urlAsString)
        
        let method = "\(request.httpMethod ?? "")"
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        
        var logOutput = """
                        \(urlAsString) \n\n
                        \(method) \(path)?\(query) \n
                        HOST: \(host)\n
                        """
        
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            logOutput += "\(key): \(value) \n"
        }
        
        if let body = request.httpBody {
            logOutput += "\n \(String(data: body, encoding: .utf8) ?? "")"
        }
        
        logger.info("\(logOutput)")
        logger.info("\n - - - - - - - - - -  END - - - - - - - - - - \n")
    }
    
    func log(data: Data?, response: URLResponse?, error: Error?) {
        let logger = Logger(label: "CryptoDemo")
        logger.info("\n - - - - - - - - - - INCOMING - - - - - - - - - - \n")
        
        var logOutput = ""

        if let url = response?.url {
            logOutput += "URL: \(url.absoluteString) \n"
        }
        
        if let error = error {
            logOutput += "ERROR: \(error.localizedDescription) \n\n"
        } else {
            logOutput += "No error \n\n"
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            let statusCode = HTTPStatusCode(rawValue: httpResponse.statusCode) ?? .undefined
            logOutput += "HTTPResponse status: \(statusCode.rawValue) \(statusCode) \n\n"
        } else {
            logOutput += "Response is not HTTPResponse \n\n"
        }
        
        if let data = data {
            logOutput += "Data: \n \(String(data: data, encoding: .utf8) ?? "")"
        } else {
            logOutput += "Data is missing"
        }

        logger.info("\(logOutput)")
        logger.info("\n - - - - - - - - - -  END - - - - - - - - - - \n")
    }
    
}
