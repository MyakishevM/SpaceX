//
//  NumberFormatter.swift
//  SpaceXProject
//
//  Created by Maxim Myakishev on 13.04.2022.
//

import Foundation

struct Number {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}
