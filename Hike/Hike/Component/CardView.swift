//
//  CardView.swift
//  Hike
//
//  Created by James McDougall on 6/20/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.colorIndigoMedium, .colorSalmonLight],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                    .frame(width: 256, height: 256)
                
                
                Image("image-1")
                    .resizable()
                .scaledToFit()
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
