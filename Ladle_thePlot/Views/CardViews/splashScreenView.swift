//
//  splashScreenView.swift
//  prova
//
//  Created by Rosa Cimmino on 21/02/22.
//

import SwiftUI

struct splashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.3
    @State private var opacity = 0.5
    
    var body: some View {
        
        
        if isActive {
            ContentView()
        } else {
            
            VStack{
                VStack{
                    Image("ladle")
                        .resizable()
                        .scaledToFit()
                    //                    .foregroundColor(.blue)
                    
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration : 2.0)) {
                        self.size = 0.5
                        self.opacity = 5.0
                    }
                }
                
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
        
        
    }
}


struct splashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        splashScreenView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
