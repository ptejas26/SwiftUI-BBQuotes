//
//  QuotesModel.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-18.
//

import Foundation

struct QuoteModel: Decodable {
    let quote: String
    let character: String
    let production: String
}


struct CharacterModel: Decodable {
    let name: String
    let birthDay: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let portrayedBy: String
    
}
