//
//  PairDetails.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import SwiftUI

struct PairDetails: View {
    private let pair: Pair
    
    init(pair: Pair) {
        self.pair = pair
    }
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            HStack {
                content
                Spacer()
            }.padding()
        }
    }
}

extension PairDetails {
    private var title: some View {
        Text(Constants.title)
            .font(.system(size: 43, weight: .bold))
    }
    
    private var symbolRow: some View {
        VStack(alignment: .leading) {
            Text(Constants.symbol)
                .font(Constants.font)
            Text(pair.symbol)
                .font(Constants.font)
        }
    }
    
    private var priceChangeRow: some View {
        VStack(alignment: .leading) {
            Text(Constants.priceChange)
                .font(Constants.font)
            Text(pair.priceChange)
                .font(Constants.font)
        }
    }
    
    private var priceChangePercentRow: some View {
        VStack(alignment: .leading) {
            Text(Constants.priceChangePercent)
                .font(Constants.font)
            Text(pair.priceChangePercent + "%")
                .foregroundStyle(percentColor())
                .font(Constants.font)
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            title
            Spacer()
            symbolRow
            priceChangeRow
            priceChangePercentRow
            Spacer()
        }
    }
    
    private func percentColor() -> Color {
        pair.priceChangePercent.hasPrefix("-") ? Color.red : Color.green
    }
}

private enum Constants {
    static let title = "Pair Details"
    static let spacing = 50.0
    static let symbol = "Symbol"
    static let priceChange = "Price change"
    static let priceChangePercent = "Price change percent"
    static let font: Font = .system(size: 25)
}

#Preview {
    PairDetails(pair: .init(symbol: "ETHBTC", priceChange: "0.000315903", priceChangePercent: "-2.424", bidPrice: "0.000315903", askPrice: "0.000315903"))
}
