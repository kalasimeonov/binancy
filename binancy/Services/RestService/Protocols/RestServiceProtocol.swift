//
//  RestServiceProtocol.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

protocol RestServiceProtocol {
    func send<Response: Decodable>(_ request: APIRequestProtocol) async throws -> Response
}
