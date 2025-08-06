//
//  RestService.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import Foundation

class RestService: RestServiceProtocol {
    private let session: URLSession
    private let baseURL: URL?
    
    init(baseURL: URL? = URL(string: Constants.baseURLString)) {
        self.session = .shared
        self.baseURL = baseURL
    }
    
    func send<Response: Decodable>(_ request: any APIRequestProtocol) async throws -> Response {
        guard let baseURL else { throw APIError.badUrl }
        
        var components = URLComponents(url: baseURL.appendingPathComponent(request.path), resolvingAgainstBaseURL: false)
        let queryItems: [URLQueryItem] = request.queryParameters?.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        } ?? []
        components?.queryItems = queryItems

        guard let finalURL = components?.url else {
            throw APIError.badUrl
        }

        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.method.rawValue

        if let headers = request.headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }

        let (data, response) = try await session.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              Constants.responseCodeSuccessRange.contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }

        do {
            return try JSONDecoder().decode(Response.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }
}

private enum Constants {
    static let baseURLString = "https://api.binance.com/api/v3/"
    static let responseCodeSuccessRange = 200..<300
}
