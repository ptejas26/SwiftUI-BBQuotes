//
//  Constants.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-18.
//

import Foundation

enum Constants {
    static let bbName: String = "Breaking Bad"
    static let bcsName: String = "Better Call Saul"
}

extension String {
    var replanceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
    
    var noSpaces: String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    var lowerNoSpaces: String {
        self.noSpaces.lowercased()
    }
}
