//
//  CharacterView.swift
//  BB-Quotes
//
//  Created by Tejas on 2023-06-20.
//

import SwiftUI

struct CharacterView: View {
    
    let character: CharacterModel
    let show: String
    @State var showInfoSelector: Bool = false

    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                ZStack(alignment: .top) {
                    ZStack {
                        Image(show.lowerNoSpaces)
                            .resizable()
                            .scaledToFit()
                    }
                    Spacer()
                    ScrollView {
                        // character image
                        VStack {
                            AsyncImage(url: character.images.randomElement()!) {
                                
                                image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }

                        }
                        .frame(width: geo.size.width/1.2, height: geo.size.height/2)
                        .cornerRadius(20)
                        .padding(.top, 100)
                        
                        Spacer()
                        VStack(alignment: .leading) {
                            
                            Group {
                                
                                Text(character.name)
                                    .font(.largeTitle)
                                Text("Portrayed by: \(character.portrayedBy)")
                                    .font(.headline)
                                
                                Divider()
                                
                                Text("\(character.name) Character Info")
                                    .font(.title2)
                                
                                Text("Born: \(character.birthday)")
                                
                                Divider()
                            }
                            
                            Group {
                                
                                Text("Occupation: ")
                                
                                ForEach(character.occupations, id: \.self) { occupation in
                                    Text("∙ \(occupation)")
                                }
                                Divider()
                                Text("Nicknames: ")
                                
                                if character.aliases.count > 0 {
                                    ForEach(character.aliases, id: \.self) { nickNames in
                                        Text("∙ \(nickNames)")
                                    }
                                } else {
                                    Text("∙ None")
                                }
                            }
                        }
                        .padding([.leading, .bottom], 40)
                        
                    }
                }
                Button {
                    showInfoSelector.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .offset(x: geo.size.width * 0.4, y: -geo.size.height * 0.35)
                .sheet(isPresented: $showInfoSelector) {
                    RandomQuoteView(character: character.name)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView(character: Constants.previewCharacter, show: Constants.bbName)
        .preferredColorScheme(.dark)
}
