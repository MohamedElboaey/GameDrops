//
//  ChooseAvatarView.swift
//  GameDrops
//
//  Created by Mohamed Elboraey on 12/08/2024.
//

import SwiftUI

struct ChooseAvatarView: View {
    @State private var selectedGender = 0
    @State private var selectedAvatar: Int? = nil
    let genders = ["Female", "Male"]
    let femaleAvatars = [
        "Component 29 – 1", "Component 1387 – 1"
    ]
    let maleAvatars = [
        "Component 1387 – 1", "Component 29 – 1", "Component 29 – 1",
        "Component 29 – 1", "Component 29 – 1"
    ]
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                Image("Component 29 – 1")
                    .resizable()
                
                VStack {
                    if let selectedAvatar = selectedAvatar {
                        CircleProfileImageWithEditButton(profileImage: getAvatars()[selectedAvatar], action: {nil})
                        
                    } else {
                        CircleProfileImageWithEditButton( action: {print("edited tapped")})
                    }
                    Text("Omnia Yehia")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .padding(.top, 10)
                    VStack(spacing: 20) {
                        Picker("", selection: $selectedGender) {
                            ForEach(0..<genders.count) { index in
                                Text(self.genders[index]).tag(index)
                                    
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        .onChange(of: selectedGender) { _ in
                            selectedAvatar = nil
                        }
                        
                        Text("Choose Avatar:")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                            ForEach(getAvatars(), id: \.self) { avatar in
                                let isSelected = selectedAvatar == getAvatars().firstIndex(of: avatar)
                                Button(action: {
                                    self.selectedAvatar = getAvatars().firstIndex(of: avatar)
                                }) {
                                    ZStack(alignment: .bottomTrailing) {
                                        Image(avatar)
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(isSelected ? Color.green : Color.clear, lineWidth: 4)
                                            )
                                        
                                        if isSelected {
                                            ZStack {
                                                Circle()
                                                    .fill(Color.green)
                                                    .frame(width: 24, height: 24)
                                                Image(systemName: "checkmark")
                                                    .resizable()
                                                    .frame(width: 12, height: 12)
                                                    .accentColor(.white)
                                                    
                                            }
                                        }
                                    }
                                }
                                .padding(.top)
                            }
                        }
                        Spacer()
                        
                        Button(action: {
                            // Handle save action
                            print("save tapped")
                        }) {
                            Text("Save")
                                .fontWeight(.bold)
                                .frame(width: 200, height: 50)
                                .background(Color.yellow)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        .padding(.bottom, 50)
                    }
                    .padding()
                    
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
                .offset(x: 20, y: 110)
                
                Button(action: {
                    //                back action button
                    print("back selected")
                }, label: {
                    Image(systemName:"arrow.left")
                        .resizable()
                        .frame(width: 39, height: 39)
                        .accentColor(.white)
                })
                .offset(x: 25, y: 40)
            }
            
        }
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
        .onDisappear {
            UIScrollView.appearance().bounces = true
        }
        .ignoresSafeArea()
    }
    func getAvatars() -> [String] {
        return selectedGender == 0 ? femaleAvatars : maleAvatars
    }
}

#Preview {
    ChooseAvatarView()
}
