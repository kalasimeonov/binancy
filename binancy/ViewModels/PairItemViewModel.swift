//
//  PairItemViewModel.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import Foundation

struct PairItemViewModel {
    let symbol: String
    let priceChangePercent: String
    let bidAskSpread: String
    
    init(pair: Pair) {
        symbol = pair.symbol
        priceChangePercent = pair.priceChangePercent + "%"
        bidAskSpread = pair.bidPrice + "/" + pair.askPrice
    }
    
    func isPercentagePositive() -> Bool {
        !priceChangePercent.hasPrefix("-")
    }
}
