//
//  CacheManager.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import Foundation

protocol CacheManagerProtocol {
    func save<T: Encodable>(_ data: T)
    func load<T: Decodable>() -> T?
}

class CacheManager: CacheManagerProtocol {
    private let fileName = Constants.fileName

    private var fileURL: URL? {
        try? FileManager.default
            .url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent(fileName)
    }

    func save<T: Encodable>(_ data: T) {
        guard let url = fileURL else { return }
        do {
            let encoded = try JSONEncoder().encode(data)
            try encoded.write(to: url)
        } catch {
            print("\(Constants.failedToCacheMessage) \(error)")
        }
    }

    func load<T: Decodable>() -> T? {
        guard let url = fileURL else { return nil }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("\(Constants.failedToLoadCacheMessage) \(error)")
            return nil
        }
    }
}

private enum Constants {
    static let fileName = "crypto_cache.json"
    static let failedToCacheMessage = "Failed to cache data:"
    static let failedToLoadCacheMessage = "Failed to load cache:"
}
