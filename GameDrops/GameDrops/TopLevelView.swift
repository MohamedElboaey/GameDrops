//
//  TopLevelView.swift
//  GameDrops
//
//  Created by Mohamed Elboraey on 12/08/2024.
//

import SwiftUI

struct TopLevelView: View {
    var gamesList = ["first", "second"]
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            ScrollView {
                ZStack {
                    Image("Component 29 – 1")
                        .resizable()
                    
                    VStack {
                        CircleProfileImage(profileImage: nil)
                        
                        textHandler(text: "YOUR GAMES", font: .title2, fontWeight: .heavy, fontColor: .white)
                            .padding(.top, 10)
                        VStack {
                            HStack(spacing: 30) {
                                ForEach(gamesList, id: \.self) { game in
                                    GamesImage()
                                }
                            }
                            .offset(x: -70)
                            textHandler(text: "LEADER BOARD", font: .title2, fontWeight: .heavy, fontColor: .white)
                                .padding(.top, 24)
                            Top3View()
                                .padding(.top, 140)
                            Image("Component 29 – 1")
                                .resizable()
                                .frame(height: 170)
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            
                        }
                        .padding(.bottom, 90)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Image("Component 29 – 1")
                        .resizable()
                        .cornerRadius(50, corners: [.topLeft, .topRight])
                    )
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top, 150)
                    .padding(.bottom, 130)
                    
                    Button(action: {
                        //                swipe down action button
                        print("SWIPE DOWN")
                    }, label: {
                        VStack(spacing: 5) {
                            Text("SWIPE DOWN")
                                .fontWeight(.bold)
                            VStack(spacing: -3) {
                                Image(systemName:"chevron.down")
                                Image(systemName:"chevron.down")
                            }
                        }
                        .accentColor(.white)
                        .font(.caption)
                    })
                    .frame(height: 30)
                    .offset(x: -width/3 ,y: -440)
                }
                
                
            }
            .onAppear {
                UIScrollView.appearance().bounces = false
            }
            .onDisappear {
                UIScrollView.appearance().bounces = true
            }
            .ignoresSafeArea()
            .overlay(
                
                ZStack(alignment: .bottom) {
                    Button(action: {
                        //            exstra trail action
                        print("exstra trail action")
                    }, label: {
                        Image("Component 29 – 1")
                            .resizable()
                            .frame(width: 150, height: 50)
                    })}.frame(width: 150, height: 50)
                    .offset(y: height/2.2))
        }
    }
}

#Preview {
    TopLevelView()
}
