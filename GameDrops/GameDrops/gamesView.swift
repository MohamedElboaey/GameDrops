//
//  gamesView.swift
//  GameDrops
//
//  Created by Mohamed Elboraey on 06/08/2024.
//

import SwiftUI

struct gamesView: View {
    @Binding var selectedGame: String
    let games = [
        ("Game1", "dice"),
        ("Game2", "dice"),
        ("Game3", "dice")
//        ("Game4", "dice")
//        ("Game5", "dice"),
//        ("Game6", "dice")
    ]
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Image("Component 29 – 1")
                    .resizable()
                    .cornerRadius(45)
                    .overlay(
                        Group {
                            if games.count >= 4 {
                                ScrollView(showsIndicators: false) {
                                    VStack {
                                        ForEach(games, id: \.0) { game in
                                            Games(gameName: game.0, gameIcon: game.1, selectedGame: $selectedGame)
                                        }
                                    }
                                    .padding(.top, 60)
                                }
                                .padding(.top)
                            } else {
                                VStack {
                                    ForEach(games, id: \.0) { game in
                                        Games(gameName: game.0, gameIcon: game.1, selectedGame: $selectedGame)
                                    }
                                }
                                .padding(.top, 50)
                            }
                        }
                        
                    )
            }
            .frame(height: 350)
            .padding(.top, 50)
            
            Image("Component 1387 – 1")
                .padding(.top, 18)
        }
        .background(Color.clear)
        .padding(.horizontal, 55)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}
struct Games: View {
    let gameName: String
    let gameIcon: String
    @Binding var selectedGame: String
    
    var isSelected: Bool {
        selectedGame == gameName
    }
    
    var body: some View {
        HStack {
            Text(gameName)
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: gameIcon)
                .resizable()
                .frame(width: 40, height: 40)
        }
        .padding()
        .background(Color.gray)
        .foregroundColor(.white)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(isSelected ? Color.yellow : Color.clear, lineWidth: 2)
        )
        .padding(.horizontal, 20)
        .onTapGesture {
            selectedGame = gameName
        }
    }
    
}

#Preview {
    gamesView(selectedGame: .constant("Game2"))
}
