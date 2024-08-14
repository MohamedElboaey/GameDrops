//
//  SelectAvatarView.swift
//  GameDrops
//
//  Created by Mohamed Elboraey on 10/08/2024.
//

import SwiftUI

struct OptionsView: View {
    var gamesList = ["first", "second"]
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("Component 29 – 1")
                .resizable()
            
            VStack {
                CircleProfileImageWithEditButton(action: {print("edite profile")})
                Text("Omnia Yehia")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding(.top, 10)
                VStack {
                    HStack(spacing: 30) {
                        ForEach(gamesList, id: \.self) { game in
                            GamesImage()
                        }
                    }
                    Image("Component 29 – 1")
                        .resizable()
                        .frame(width: 200,height: 50)
                        .padding(.bottom, 35)
                    ScrollView {
                        VStack {
                            LeaderBordersButtons(image: "Component 29 – 1", height: 150) {
                                //                    the action
                            }
                            .padding(.bottom)
                            LeaderBordersButtons(image: "Component 29 – 1", height: 120) {
                                //                    the action
                            }
                            .padding(.bottom)
                            LeaderBordersButtons(image: "Component 29 – 1", height: 120) {
                                //                     the action
                            }
                            
                        }
                    }
                    .onAppear {
                        UIScrollView.appearance().bounces = false
                    }
                    .onDisappear {
                        UIScrollView.appearance().bounces = true
                    }
                    .padding(.bottom, 50)
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white
                .cornerRadius(50, corners: [.topLeft, .topRight]))
                .shadow(radius: 10)
            
            .padding(.horizontal)
            .padding(.top, 150)
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
            .offset(x: 20 , y: 110)
            
            Button(action: {
                //                back action button
                print("back selected")
            }, label: {
                Image(systemName:"arrow.left")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .accentColor(.white)
            })
            .padding(.top, 40)
            .padding(.leading, 25)
        }
        .ignoresSafeArea()
    }
}

struct GamesImage: View {
    @State private var isSelected = false
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .clipShape(Circle())
            .aspectRatio(contentMode: .fill)
            .frame(width: 60, height: 60)
            .overlay(
                Circle().stroke(isSelected ? Color.yellow : Color.clear, lineWidth: 2))
            .onTapGesture {
                isSelected.toggle()
            }
    }
}

struct LeaderBordersButtons: View {
    var image: String
    var height: CGFloat
    var action: () -> ()
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(image)
                .resizable()
                .frame(height: height)
                .clipShape(.rect(cornerRadius: 20))
        })
        .padding(.horizontal)
        .padding(.leading)
    }
}

#Preview {
    OptionsView()
}
