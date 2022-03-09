//
//  NetworkManager.swift
//  CryptoDemo
//
//  Created by Aleksandar Dinic on 03/08/2022.
//  Copyright © 2022 Aleksandar Dinic. All rights reserved.
//

import Foundation

final class NetworkManager<Endpoint: EndpointType>: NetworkLogger {
    
    private let session: URLSession
    private var task: URLSessionTask?
    
    init(session: URLSession = .shared) {
        self.session = session
    }

    func request(
        _ route: Endpoint,
        onComplete complete: @escaping (Result<NetworkResponse, Error>) -> Void
    ) {
        let request = buildRequest(from: route)
        log(request: request)

        task = session.dataTask(with: request) { [weak self ] data, response, error in
            guard let self = self else { return }
            self.log(data: data, response: response, error: error)

            if let error = error {
                return complete(.failure(error))
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                return complete(.failure(NetworkError.invalidResponse))
            }
            
            complete(.success(NetworkResponse(statusCode: httpResponse.statusCode, data: data)))
        }
        
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
    
    private func buildRequest(from endpoint: Endpoint) -> URLRequest {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let httpBody = endpoint.body {
            request.httpBody = httpBody
        }
        
        if let urlWithQueryParameters = addQueryParameters(from: endpoint, url: url) {
            request.url = urlWithQueryParameters
        }
        
        for (key, value) in endpoint.headers ?? [:] {
            request.setValue(value, forHTTPHeaderField: key)
        }

        return request
    }
    
    private func addQueryParameters(from endpoint: Endpoint, url: URL) -> URL? {
        guard
            let queryParameters = endpoint.queryParameters,
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else { return nil }
        
        urlComponents.queryItems = [URLQueryItem]()
            
        for (key,value) in queryParameters {
            let queryItem = URLQueryItem(name: key, value: value)
            urlComponents.queryItems?.append(queryItem)
        }
        
        return urlComponents.url
    }
    
}
