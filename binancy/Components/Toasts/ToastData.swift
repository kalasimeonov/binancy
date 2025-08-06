//
//  ToastType.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import Foundation

enum ToastType {
    case success, error, info
}

struct ToastData: Identifiable, Equatable {
    let id = UUID()
    let message: String
    let type: ToastType
}
