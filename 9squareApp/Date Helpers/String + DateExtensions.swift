//
//  String + DateExtensions.swift
//  9squareApp
//
//  Created by Genesis Mosquera on 2/15/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

extension String {
    public func formatISODateString(dateFormat: String) -> String {
        var formatDate = self
        let isoDateFormatter = ISO8601DateFormatter()
        if let date = isoDateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            formatDate = dateFormatter.string(from: date)
        }
        return formatDate
    }
    public func date() -> Date {
        var date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        if let isoDate = isoDateFormatter.date(from: self) {
            date = isoDate
        }
        return date
    }
}
