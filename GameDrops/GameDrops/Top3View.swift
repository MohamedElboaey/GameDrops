//
//  Top3View.swift
//  GameDrops
//
//  Created by Mohamed Elboraey on 11/08/2024.
//

import SwiftUI

struct Top3View: View {
    var body: some View {
        GeometryReader { geometry in
                    let width = geometry.size.width
                    let centerWidth = width * 0.3
                    let sideWidth = width * 0.25
                    
                    ZStack(alignment: .top) {
                        VStack(spacing: 40) {
                            Top3Images(num: "1", borderColor: Color(hex: "#FFAA00"),isFirst: true)
                                .padding(.top, -50)
                            VStack(spacing: 8) {
                                VStack(spacing: -5) {
                                    textHandler(text: "Eiden", font: .callout, fontWeight: .bold, fontColor: .white)
                                    textHandler(text: "@username", font: nil, fontWeight: nil, fontColor: Color(hex: "#B7B3B3"))
                                }
                                textHandler(text: "2430", font: .title, fontWeight: .bold, fontColor: Color(hex: "#FFAA00"))
                                                .minimumScaleFactor(0.5)
                            }
                            .minimumScaleFactor(0.5)
                            .padding(.bottom)
                        }
                        
                        .frame(width: centerWidth)
                        .background(Color(hex: "#1B0000")
                            .cornerRadius(12, corners: [.topLeft, .topRight])
                            .shadow(radius: 10)
                        )
                        .padding(.top, -60)
                        
                        HStack {
                            VStack(spacing: 40) {
                                Top3Images(num: "2", borderColor: Color(hex: "#009BD6"))
                                    .padding(.top, -65)
                                VStack(spacing: 8) {
                                    VStack(spacing: -5) {
                                        textHandler(text: "Jackson", font: .callout, fontWeight: .bold, fontColor: .white)
                                        textHandler(text: "@username", font: nil, fontWeight: nil, fontColor: Color(hex: "#B7B3B3"))
                                    }
                                    textHandler(text: "1847", font: .title, fontWeight: .bold, fontColor: Color(hex: "#009BD6"))
                                }
                                .minimumScaleFactor(0.5)
                                .padding(.bottom)
                            }
                            .frame(width: sideWidth)
                            
                            Spacer()
                            
                            VStack(spacing: 40) {
                                Top3Images(num: "3", borderColor: Color(hex: "#00D95F"))
                                    .padding(.top, -65)
                                VStack(spacing: 8) {
                                    VStack(spacing: -5) {
                                        textHandler(text: "Omnia", font: .callout, fontWeight: .bold, fontColor: .white)
                                        textHandler(text: "@username", font: nil, fontWeight: nil, fontColor: Color(hex: "#B7B3B3"))
                                    }
                                    textHandler(text: "1674", font: .title, fontWeight: .bold, fontColor: Color(hex: "#00D95F"))
                                }
                                .minimumScaleFactor(0.5)
                                .padding(.bottom)
                            }
                            .frame(width: sideWidth)
                        }
                        .padding(.horizontal)
                    }
                    .background(Color(hex: "#170000")
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .shadow(radius: 10)
                    )
                    .padding(.horizontal)
                }
        .aspectRatio(2.6, contentMode: .fit)
            }
    
    
}

struct Top3Images: View {
    var num: String
    var borderColor: Color
    var isFirst: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            if isFirst {
                Image(systemName: "crown.fill")
                    .foregroundColor(Color(hex: "#FFAA00"))
                    .font(.system(size: 30))
                    .offset(y: -99) // Crown positioning
            }
            Image("Component 1387 – 1") // Replace with actual image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: isFirst ? 100 : 90, height: isFirst ? 100 : 90)
                .clipShape(Circle())
                .overlay(Circle().stroke(borderColor, lineWidth: 4))
            
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 6).fill(borderColor).rotationEffect(Angle(degrees: 45))
                    .frame(width: 24, height: 24)
                if isFirst {
                    Text(num)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.leading, -2)
                } else {
                    Text(num)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
            }
            
            .offset(y: 30)
        }
        .frame(width: isFirst ? 100 : 90, height: isFirst ? 100 : 90)
    }
}

#Preview {
    Top3View()
}
