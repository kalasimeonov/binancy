//
//  LoadingView.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import SwiftUI

struct LoadingView: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        TimelineView(.animation) { context in
            let time = context.date.timeIntervalSinceReferenceDate
            let rotation = Angle.degrees((time * 120).truncatingRemainder(dividingBy: 360))
            let scale = abs(sin(time * 2)) * 0.4 + 0.8
            ZStack {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [Color.yellow, Color.orange]),
                            center: .center
                        ),
                        lineWidth: 6
                    )
                    .frame(width: 80, height: 80)
                    .rotationEffect(rotation)
                
                Image("btc")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaleEffect(scale)
            }
            Text(title)
                .font(.system(size: 30, weight: .black, design: .rounded))
                .foregroundStyle(Color.orange)
        }
    }
}
