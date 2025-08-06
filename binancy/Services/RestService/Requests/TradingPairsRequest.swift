//
//  TradingPairsRequest.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

struct TradingPairsRequest: APIRequestProtocol {
    let path: String
    let method: HTTPMethod
    let queryParameters: [String: Any]?
    let headers: [String: String]?
    
    init(path: String = Constants.path,
         method: HTTPMethod = .get,
         queryParameters: [String: Any]? = nil,
         headers: [String : String]? = nil) {
        self.path = path
        self.method = method
        self.queryParameters = queryParameters
        self.headers = headers
    }
}

private enum Constants {
    static let path = "ticker/24hr"
}
