//
//  ToastView.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import SwiftUI

struct ToastView: View {
    let data: ToastData

    var backgroundColor: Color {
        switch data.type {
        case .success: return Color.green.opacity(Constants.colorOpacity)
        case .error: return Color.red.opacity(Constants.colorOpacity)
        case .info: return Color.blue.opacity(Constants.colorOpacity)
        }
    }

    var body: some View {
        Text(data.message)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(Constants.cornerRadius)
            .shadow(radius: Constants.shadowRadius)
            .padding(.horizontal, Constants.horizontalPadding)
            .transition(.move(edge: .top).combined(with: .opacity))
    }
}

private enum Constants {
    static let colorOpacity = 0.9
    static let cornerRadius = 12.0
    static let shadowRadius = 5.0
    static let horizontalPadding = 16.0
    static let animationDuration = 0.3
}
