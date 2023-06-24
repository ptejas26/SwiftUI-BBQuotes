//
//  ViewModel.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-18.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data: (quote: QuoteModel, character: CharacterModel))
        case characterSuccess(data: CharacterModel)
        case failed(error: Error)
    }
    
    @Published private(set) var status: Status = .notStarted
    
    private let controller: FetchController
    
    init(controller: FetchController) {
        self.controller = controller
    }
    
    
    func getData(for show: String) async {
        status = .fetching
        do {
            let quote = try await self.controller.fetchQuote(from: show)
            let character = try await self.controller.fetchCharacter(quote.character)
            status = .success(data: (quote: quote, character: character))
        } catch {
            status = .failed(error: error)
        }
    }
    
    func getRandomCharacter() async {
        status = .fetching
        do {
            let character = try await self.controller.fetchRandomCharacter()
            status = .characterSuccess(data: character)
        } catch {
            status = .failed(error: error)
        }
    }
    
    func getQuote(for character: String) async throws {
        status = .fetching
        do {
            guard let quote = try await self.controller.fetchQuotes(for: character) else {
                throw CustomError.noQuote
            }
            status = .success(data: (quote: quote, character: CharacterModel(name: "", birthday: "", occupations: [], images: [], aliases: [], portrayedBy: "")))

        } catch {
            status = .failed(error: error)
        }
    }
    
    enum CustomError: Error {
        case noQuote
    }
}
