//
//  InviteFriendsView.swift
//  GameDrops
//
//  Created by Mohamed Elboraey on 12/08/2024.
//

import SwiftUI
import UIKit

struct InviteFriendsView: View {
    @State private var showShareSheet = false
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            ZStack(alignment: .topLeading) {
                Image("Component 29 – 1")
                    .resizable()
                
                VStack {
                    CircleProfileImage()
                    Spacer()
                    ZStack {
                        Image("Component 29 – 1")
                            .resizable()
                            .frame(height: 80)
                            .padding(.horizontal)
                            .padding(.bottom, 250)
                        VStack(spacing: 30) {
                            HStack {
                                Image(systemName: "square.fill.on.square.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                textHandler(text: "Copy the link below and invite your friends", font: .callout, fontWeight: .regular, fontColor: .white)
                            }
                            .padding(.horizontal)
                            textHandler(text: "copylinkcopylinkcopylinkcopylink", font: .callout, fontWeight: .regular, fontColor: .black)
                                .frame(height: 60)
                                .padding(.horizontal)
                                .background(Color.white.cornerRadius(12, corners: .allCorners))
                        }
                        .padding(.top, 30)
                        
                    }
                    .frame(height: 250)
                    .background(Color(hex: "#170000").cornerRadius(20, corners: .allCorners))
                    .padding(.horizontal)
//                    .padding(.bottom, height/8)
                    Spacer()
                    VStack {
                        Button(action: {
                            shareLink(link: "www.example.com")
                        }, label: {
                            Image("Component 29 – 1")
                                .resizable()
                                .frame(width: 150, height: 50)
                        })
                        Button(action: {
                            print("second button pressed")
                        }, label: {
                            Image("Component 29 – 1")
                                .resizable()
                                .frame(width: 150, height: 50)
                        })
                    }
                    .padding(.bottom, 10)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("Component 29 – 1")
                    .resizable()
                    .cornerRadius(50, corners: [.topLeft, .topRight])
                )
                .shadow(radius: 10)
                
                .padding(.horizontal)
                .padding(.top, height/4)
                
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
                .offset(x: 20, y: height/5.2)
                
                Button(action: {
                    //                back action button
                    print("back pressed")
                }, label: {
                    Image(systemName:"arrow.left")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .accentColor(.white)
                })
                .frame(width: 45, height: 45)
                .offset(x: 25, y: 40)

            }
            .ignoresSafeArea()
            }
        }
    }


#Preview {
    InviteFriendsView()
}
