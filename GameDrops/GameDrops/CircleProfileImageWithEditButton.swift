//
//  CircleProfileImageWithEditButton.swift
//  GameDrops
//
//  Created by Mohamed Elboraey on 10/08/2024.
//

import SwiftUI

struct CircleProfileImageWithEditButton: View {
    var profileImage: String?
    var action: () -> ()?
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(profileImage ?? "")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                Circle().stroke(Color.black, lineWidth: 4)
            
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 24, height: 24)
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(.leading,3)
                    .onTapGesture {
                        action()
                    }
                
            }
            .padding(.trailing, 6)
            .padding(.bottom, 2)
                
        }
        .frame(width: 100, height: 100)
        .padding(.top, -50)
        .shadow(radius: 10)
    }
}

#Preview {
    CircleProfileImageWithEditButton(profileImage: nil, action: { nil })
}
