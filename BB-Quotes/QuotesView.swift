//
//  QuotesView.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-18.
//

import SwiftUI

struct QuotesView: View {
    
//    let viewModel = ViewModel(controller: FetchController())
    var body: some View {
        GeometryReader { geo in
        
            ZStack {
                Image("breakingbad")
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                VStack {
                    Spacer()
                    
                    Text("\"You either run from things, or you face them, Mr. White\"")
                    // this property will scale down the font size for long text size 
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .cornerRadius(15)
                        .padding(.horizontal)
                    
                    ZStack(alignment: .bottom) {
                        Image("jessepinkman")
                            .resizable()
                            .scaledToFill()
                        Text("Jesse Pinkman")
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                    }
                    .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                    .cornerRadius(40)
                
                    Spacer()
                    
                    Button() {
                        
                    } label: {
                        Text("Get Random Quotes")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(.breadingBadGreen))
                            .cornerRadius(12)
                            .shadow(color: Color(.breadBadYellow), radius: 10)
                    }
                    
                    Spacer(minLength: 100)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }.ignoresSafeArea()
        
    }
}

#Preview {
    QuotesView()
        .preferredColorScheme(.dark)
}
