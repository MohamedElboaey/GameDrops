//
//  CircleProfileImage.swift
//  GameDrops
//
//  Created by Mohamed Elboraey on 12/08/2024.
//

import SwiftUI

struct CircleProfileImage: View {
    var profileImage: String?
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            Circle().stroke(Color.black, lineWidth: 4)
        }
        .frame(width: 100, height: 100)
        .padding(.top, -50)
        .shadow(radius: 10)
    }
}

#Preview {
    CircleProfileImage(profileImage: nil)
}
