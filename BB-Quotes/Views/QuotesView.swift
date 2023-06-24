//
//  QuotesView.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-18.
//

import SwiftUI

struct QuotesView: View {
    
    @ObservedObject private var  viewModel = ViewModel(controller: FetchController())
    let showString: String
    @State private var showCharacterInfo: Bool = false
    
    
    var body: some View {
        GeometryReader { geo in
        
            ZStack {
                Image(showString.lowerNoSpaces)
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                VStack {
                    VStack {
                        Spacer()
                        
                        switch viewModel.status {
                        case .success(let data):
                            Text("\"\(data.quote.quote)\"")
                            // this property will scale down the font size for long text size
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding()
                                .background(.black.opacity(0.5))
                                .cornerRadius(15)
                                .padding(.horizontal)
                            
                            ZStack(alignment: .bottom) {
                                
                                AsyncImage(url: data.character.images.first!) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                                
                                .onTapGesture(perform: {
//                                    NavigationLink(destination: CharacterView(character: Constants.previewCharacter, show: Constants.bbName)) {
//                                        Text("Welcome")
//                                    }
                                    showCharacterInfo.toggle()
                                })
                                .sheet(isPresented: $showCharacterInfo, content: {
                                    CharacterView(character: data.character, show: showString)
                                })
                                
                                
                                Text(data.quote.character)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                            }
                            .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                            .cornerRadius(40)
                            
                            Spacer()
                        case .fetching:
                            ProgressView()
                        default:
                            EmptyView()
                        }
                    }
                    Button() {
                        Task {
                            await viewModel.getData(for: showString)
                        }
                        
                    } label: {
                        Text("Get Random Quotes")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("\(showString.noSpaces)Button"))
                            .cornerRadius(12)
                            .shadow(color: Color("\(showString.noSpaces)Shadow"), radius: 10)
                    }
                    
                    Spacer(minLength: 100)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            Task {
                await viewModel.getData(for: Constants.bbName)
            }
        }
    }
}

#Preview {
    QuotesView(showString: Constants.bbName)
        .preferredColorScheme(.dark)
}
