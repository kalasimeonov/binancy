//
//  PairItem.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import SwiftUI

struct PairItem: View {
    private let viewModel: PairItemViewModel
    
    init(viewModel: PairItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            symbolPercent
            bidAskSpread
        }
    }
}

extension PairItem {
    private var symbolPercent: some View {
        HStack {
            Text(viewModel.symbol)
            Spacer()
            Text(viewModel.priceChangePercent)
                .foregroundStyle(viewModel.isPercentagePositive() ?
                                 Color.green : Color.red)
        }
    }
    
    private var bidAskSpread: some View {
        HStack {
            Text("\(Constants.bidAskString) \(viewModel.bidAskSpread)")
            Spacer()
        }
    }
}

private enum Constants {
    static let bidAskString = "BID/ASK:"
}
