//
//  ContentView.swift
//  GameDrops
//
//  Created by Mohamed Elboraey on 06/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var viewHeight: CGFloat = 150
    @State private var selectedGame: String = ""
    
    var body: some View {
            ZStack(alignment: .topLeading) {
                Image("Component 29 – 1")
                    .resizable()
                    .ignoresSafeArea(edges: .all)
                VStack {
                    gamesView(selectedGame: $selectedGame)
                    Button(action: {
                        //                    action play Button
                        print("paly now")
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "play")
                            Text("Play Now")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .frame(height: 40)
                        }
                        .padding(.horizontal, 30)
                    }
                    .disabled(selectedGame.isEmpty)
                    .opacity(selectedGame.isEmpty ? 0.5 : 1.0)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .padding(.top)
                    .padding(.bottom, 50)
                    Spacer()
                    bottomView
                }
                .ignoresSafeArea(edges: .bottom)
                Button(action: {
                    // Action for the top-left button
                    print("back selected")
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .padding()
                }
                .offset(x: 5)
        }
    }
    
    var bottomView: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            
            ZStack {
                VStack {
                    CircleProfileImageWithEditButton(action: {print("edite profile")})
                    Text("Omnia Yehia")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.bottom, 3)
                    Text("My Score")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.bottom, 15)
                }
                Button(action: {
                    //                swipe down action button
                    print("SWIPE UP")
                }, label: {
                    VStack(spacing: 5) {
                        Text("SWIPE UP")
                            .fontWeight(.bold)
                        VStack(spacing: -3) {
                            Image(systemName:"chevron.up")
                            Image(systemName:"chevron.up")
                        }
                    }
                    .accentColor(.white)
                    .font(.caption)
                })
                .frame(height: 30)
                .offset(x: -width/3, y: -90)
                
            }
            .frame(maxWidth: .infinity)
            .background(
                Color.white
                    .cornerRadius(50, corners: [.topLeft, .topRight])
                    .shadow(radius: 10)
            )
            .padding(.horizontal)
        }
        .frame(height: 135)
    }
}

#Preview {
    ContentView()
}
