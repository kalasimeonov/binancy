//
//  DependencyManager.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import Foundation

final class DependencyManager {
    let restHandler: RestServiceProtocol
    let cacheManager: CacheManagerProtocol
    
    init() {
        self.restHandler = RestService()
        self.cacheManager = CacheManager()
    }
}
