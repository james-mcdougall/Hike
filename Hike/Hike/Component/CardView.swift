//
//  CardView.swift
//  Hike
//
//  Created by James McDougall on 9/1/23.
//

import SwiftUI

struct CardView: View {
    
    //MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImnage() {
        print("---THE BUTTON WAS PRESSED---")
        print("STATUS: Old Image Number = \(imageNumber)")
        repeat {randomNumber = Int.random(in: 1...5)
            print("ACTION: Random Number Generated")
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        
        print("RESULT: New Image Number = \(imageNumber)")
        print("---THE END---")
        print("\n")
    }
    
    var body: some View {
        //MARK: - CARD
        
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - HEADER
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(.linearGradient(
                                colors: [.customGrayLight,
                                         .customGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            // ACTION: Show a sheet
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }

                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                } //: HEADER
                .padding(.horizontal, 30)
                
                //MARK: - MAIN CONTENT
                
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                //MARK: - FOOTER
                
                Button {
                    //ACTION: Generate a random number
                    
                    randomImnage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
                
            }
        }//: CARD
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
