//
//  binancyApp.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import SwiftUI

@main
struct binancyApp: App {
    @Environment(\.dependencies) private var dependencies

    var body: some Scene {
        WindowGroup {
            BinancyHome(viewModel: .init(restService: dependencies.restHandler, cacheManager: dependencies.cacheManager))
        }
    }
}
