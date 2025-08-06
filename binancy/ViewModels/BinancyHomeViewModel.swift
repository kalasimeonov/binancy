//
//  BinancyHomeViewModel.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import Foundation

@MainActor
final class BinancyHomeViewModel: ObservableObject {
    @Published var pairs: [Pair] = []
    @Published var isLoading: Bool = false
    @Published var toast: ToastData?
    
    private let restService: RestServiceProtocol
    private let cacheManager: CacheManagerProtocol
    private var lastFetchDate: Date?
    
    init(restService: RestServiceProtocol, cacheManager: CacheManagerProtocol) {
        self.restService = restService
        self.cacheManager = cacheManager
    }
    
    func fetchTradingPairs() async {
        let request = TradingPairsRequest()
        isLoading = true
        defer { isLoading = false }
        
        do {
            pairs = try await restService.send(request)
            lastFetchDate = Date()
            cacheManager.save(pairs)
        } catch {
            pairs = cacheManager.load() ?? []
            let message = Constants.toastMessage + (lastFetchDate?.formattedDateTime() ?? Constants.noPreviousFetchDetected)
            toast = ToastData(message: message, type: .error)
        }
    }
}

private enum Constants {
    static let toastMessage = "Could not get trading pairs. Showing last fetched data at: "
    static let noPreviousFetchDetected = "No previous fetch detected."
}
