//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by James McDougall on 6/20/24.
//

import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ? 
                LinearGradient(
                    colors: [.colorGrayMedium, .colorGrayLight],
                    startPoint: .top,
                    endPoint: .bottom)
                :
                LinearGradient(
                    colors: [.colorGrayLight, .colorGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}
