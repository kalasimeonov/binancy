//
//  ContentView.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import SwiftUI

struct BinancyHome: View {
    @ObservedObject private var viewModel: BinancyHomeViewModel
    
    init(viewModel: BinancyHomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackgroundView()
                content
                
                if let toast = viewModel.toast {
                    showToast(data: toast)
                }
            }
            .task {
                await viewModel.fetchTradingPairs()
            }
        }.tint(.black)
    }
}

extension BinancyHome {
    private var title: some View {
        Text(Constants.title)
            .font(.system(size: Constants.titleSize, weight: .bold, design: .rounded))
    }
    
    private var pairs: some View {
        ScrollView {
            ForEach(viewModel.pairs, id: \.symbol) { pair in
                NavigationLink(destination: PairDetails(pair: pair)) {
                    PairItem(viewModel: PairItemViewModel(pair: pair))
                        .padding(.vertical)
                        .contentShape(Rectangle())
                }.buttonStyle(PlainButtonStyle())
            }
        }.padding()
    }
    
    private var content: some View {
        VStack {
            if viewModel.isLoading {
                LoadingView(title: Constants.loadingText)
                    .zIndex(Constants.contentZIndex)
            } else {
                title
                pairs
            }
        }
        .refreshable {
            await viewModel.fetchTradingPairs()
        }
        .animation(.easeIn(duration: Constants.animationDuration), value: viewModel.isLoading)
        .padding()
    }
    
    private func showToast(data: ToastData) -> some View {
        VStack {
            ToastView(data: data)
            Spacer()
        }
        .zIndex(Constants.toastZIndex)
        .onAppear {
            Task {
                try? await Task.sleep(nanoseconds: Constants.toastDuration)
                withAnimation {
                    viewModel.toast = nil
                }
            }
        }
    }
}

private enum Constants {
    static let contentZIndex = 1.0
    static let title = "Trading Pairs"
    static let titleSize = 40.0
    static let dividerHeight = 1.0
    static let loadingText = "Loading..."
    static let animationDuration = 0.4
    static let toastZIndex = 2.0
    static let toastDuration: UInt64 = 2 * 1_000_000_000
}
