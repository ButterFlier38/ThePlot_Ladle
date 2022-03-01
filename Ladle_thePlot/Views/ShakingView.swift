//
//  ShakingView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 28/02/22.
//

import SwiftUI

struct ShakingView: View {
    @Binding var currentScene :Int
    @State var enabled :Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                
                Image("nuvoletta")
                    .resizable()
                    .scaledToFit()
                    .overlay(Image(systemName: "ipad.homebutton")
                                .resizable()
                                .scaledToFit()
                                .padding().padding(10)
                                .multilineTextAlignment(.center)
                                .rotationEffect(.degrees(90)))
                    .frame(height: geometry.size.height * 0.2, alignment: .bottom)
                    
                // adding shaking animation on image
                
                
            }.onShake {
                // adding the final result of the recipe
                print("device shaken at this intensity")
                currentScene += 1
                print(currentScene)
                
            }
            
        }
        
    }
    
}

//struct ShakingView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShakingView()
//    }
//}
