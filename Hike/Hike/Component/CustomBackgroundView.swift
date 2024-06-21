//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by James McDougall on 6/20/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            Color.colorGreenDark
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 12)
            
            Color.colorGreenLight
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 3)
                .opacity(0.85)
            
            LinearGradient(
                colors: [.colorGreenLight, .colorGreenMedium],
                startPoint: .top,
                endPoint: .bottom)
            .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
