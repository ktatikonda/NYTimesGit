//
//  Formatters.swift
//  NYTimes
//
//  Created by Kranthi Tatikonda on 22/03/18.
//  Copyright © 2018 Kranthi Tatikonda. All rights reserved.
//

import Foundation

struct Formatters {
    //TODO: Move objective c and swift formatters to one place
    static let dayMonthYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    static let iso8601Formatter = ISO8601DateFormatter()
}
