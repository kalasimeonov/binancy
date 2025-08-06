//
//  GradientBackgroundView.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.gray]),
                     startPoint: .topLeading,
                     endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}
