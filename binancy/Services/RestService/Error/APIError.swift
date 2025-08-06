//
//  APIError.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//


import Foundation

enum APIError: Error, LocalizedError {
    case invalidResponse
    case badUrl
    case decodingError(Error)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return Constants.inavlidResponse
        case .decodingError(let error):
            return "\(Constants.failedToDecode) \(error.localizedDescription)"
        case .badUrl:
            return Constants.badUrl
        }
    }
}

private enum Constants {
    static let inavlidResponse = "The response from the server was invalid."
    static let failedToDecode = "Failed to decode:"
    static let badUrl = "Bad URL"
}
