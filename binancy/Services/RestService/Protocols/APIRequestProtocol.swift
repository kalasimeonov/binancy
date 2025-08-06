//
//  APIRequestProtocol.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

protocol APIRequestProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}
