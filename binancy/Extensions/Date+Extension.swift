//
//  Date+Extension.swift
//  binancy
//
//  Created by Dimitar Videnov on 6.08.25.
//

import Foundation

extension Date {
    func formattedDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
}
