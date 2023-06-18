//
//  FetchController.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-18.
//

import Foundation

struct FetchController {
    enum NetworkError: Error {
        case badURL, badResponse
    }
    private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")
    
    func fetchQuote(from show: String) async throws -> QuoteModel {
        
        guard let quoteURL = baseURL?.appending(path: "quotes/random") else {
            throw NetworkError.badURL
        }
        
        var quoteComponents = URLComponents(url: quoteURL, resolvingAgainstBaseURL: true)
        let quoteItems: URLQueryItem = URLQueryItem(name: "production", value: show.replanceSpaceWithPlus)
        quoteComponents?.queryItems = [quoteItems]
        
        guard let fetchURL = quoteComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        let quote =  try JSONDecoder().decode(QuoteModel.self, from: data)
        
        return quote
    }
    
    
    func fetchCharacter(_ name: String) async throws -> CharacterModel {
        
        guard let characterURL = baseURL?.appending(path: "characters") else {
            throw NetworkError.badURL
        }
        
        var quoteComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
        let quoteItems: URLQueryItem = URLQueryItem(name: "name", value: name.replanceSpaceWithPlus)
        quoteComponents?.queryItems = [quoteItems]
        
        guard let fetchURL = quoteComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        let decoder =  JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characters = try decoder.decode([CharacterModel].self, from: data)
        return characters[0]
    }
}
