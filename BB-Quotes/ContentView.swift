//
//  ContentView.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-18.
//

import SwiftUI

struct ContentView: View {
    
//    let controller = FetchController()
//    let viewModel: ViewModel = ViewModel(controller: self.controller)
    
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
        }
        .onAppear {
            Task {

            }
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
