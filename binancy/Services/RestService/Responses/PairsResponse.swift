//
//  PairsResponse.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//


import Foundation

struct PairsResponse: Codable {
    let pairs: [Pair]
}

struct Pair: Codable {
    let symbol: String
    let priceChange: String
    let priceChangePercent: String
    let bidPrice: String
    let askPrice: String
    
    init(symbol: String,
         priceChange: String,
         priceChangePercent: String,
         bidPrice: String,
         askPrice: String) {
        self.symbol = symbol
        self.priceChange = priceChange
        self.priceChangePercent = priceChangePercent
        self.bidPrice = bidPrice
        self.askPrice = askPrice
    }
}
