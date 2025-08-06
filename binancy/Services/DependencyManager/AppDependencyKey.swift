//
//  AppDependencyKey.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import SwiftUICore

struct AppDependencyKey: EnvironmentKey {
    static let defaultValue = DependencyManager()
}

extension EnvironmentValues {
    var dependencies: DependencyManager {
        get { self[AppDependencyKey.self] }
        set { self[AppDependencyKey.self] = newValue }
    }
}
