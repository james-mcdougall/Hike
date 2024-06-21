//
//  CardView.swift
//  Hike
//
//  Created by James McDougall on 6/20/24.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        
                        Button {
                            print("The button was pressed")
                        } label: {
                            CustomButtonView()
                            
                        }
                        
                    }
                    Text("Fun and enjoyable outdoor activities for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(.colorGrayMedium)
                    
                }
                .padding(.horizontal, 30)
                
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.colorIndigoMedium, .colorSalmonLight],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing))
                        .frame(width: 256, height: 256)
                    
                    
                    Image("image-\(randomNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                Button {
                    print("The button was pressed")
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.colorGreenLight, .colorGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
