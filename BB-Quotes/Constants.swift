//
//  Constants.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-18.
//

import Foundation

extension String {
    var replanceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}