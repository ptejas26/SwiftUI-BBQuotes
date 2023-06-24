//
//  RandomQuoteView.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-24.
//

import SwiftUI

struct RandomQuoteView: View {
    @ObservedObject private var  viewModel = ViewModel(controller: FetchController())
    let character: String
    var body: some View {
        VStack {
            switch viewModel.status {
            case .success(let data):
                VStack {
                    Spacer()
                    Text(character)
                        .font(.title)
                    Divider()
                    VStack {
                        Text(data.quote.quote)
                            .font(.headline)
                    }
                    Spacer()
                    Spacer()
                    Spacer()

                }
            case .failed(error: let error):
                Text("Sorry we encountered error \n \(error.localizedDescription)")
            case .fetching:
                ProgressView()
            default:
                EmptyView()
                
            }
        }
        .onAppear {
            Task {
                try? await viewModel.getQuote(for: character.replanceSpaceWithPlus)
            }
        }
    }
}

#Preview {
    RandomQuoteView(character: "Chad")
        .preferredColorScheme(.dark)
}
