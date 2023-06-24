//
//  ContentView.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-18.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var  viewModel = ViewModel(controller: FetchController())
    @State var randomCharacter: CharacterModel
    let showNames: [String] = [Constants.bbName, Constants.bcsName]

    var body: some View {
        TabView {
            QuotesView(showString: Constants.bbName)
                .tabItem {
                    Label(Constants.bbName, systemImage: "tortoise")
                }
            
            
            QuotesView(showString: Constants.bcsName)
                .tabItem {
                    Label(Constants.bcsName, systemImage: "briefcase")
                }
            
            switch viewModel.status {
            case .characterSuccess(let data):
                CharacterView(character: data, show: showNames.randomElement()!)
                    .tabItem {
                        Label(Constants.randomCharacter, systemImage: "character.bubble.fill")
                    }
            case .fetching:
                ProgressView()
            default:
                EmptyView()
            }
            
        }
        .onAppear {
            Task {
                await viewModel.getRandomCharacter()
            }
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView(randomCharacter: Constants.previewCharacter)
        //randomCharacter: Constants.previewCharacter)
}
