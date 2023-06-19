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
            Text("Breaking Bad View")
                .tabItem {
                    Label("Breaking Bad", systemImage: "tortoise")
                }
            
            Text("Better call Saul")
                .tabItem {
                    Label("Better call Saul", systemImage: "briefcase")
                }
        }
        .onAppear {
            Task {
//                let data = try await viewModel.getData(for: "Breaking Bad")
//                print(data)
            }
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
