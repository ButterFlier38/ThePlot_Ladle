//
//  RollOutView.swift
//  Ladle_thePlot
//
//  Created by Rosa Cimmino on 08/03/22.
//

import Foundation
import SwiftUI

struct RollOutView : View{
    
    var image1 :String
    var image2 :String
    var vignette :String
    @Binding var currentScene :Int

    @State  var move :CGFloat = 0.975
    @State  var moveMattarello :CGFloat = 0.80
    @State var change :Bool = false
    
    @State var isClicked : Bool = false
    @State var count : Int = 0
    
    var body: some View{
        GeometryReader { geometry in
            ZStack {
   
                Image(change ? ((image2 != "none") ? image2 : image1) : image1)
                    .resizable()
                    .scaleEffect(0.6)
                    .aspectRatio(1.2, contentMode: .fit)
                    .position(x: geometry.size.width - geometry.size.width/2, y: geometry.size.height - geometry.size.height/2)
                
                Image("mattarello")
                    .resizable()
                    .scaleEffect(0.7)
                    .scaledToFit()
                    .rotationEffect(.degrees(90))
                    .offset(y: isClicked ? -85 :85)
                    .position(x: geometry.size.width - geometry.size.width/2, y: geometry.size.height - geometry.size.height/1.7)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: moveMattarello)
                    .onTapGesture{
                        count += 1
                        isClicked.toggle()
                        moveMattarello =  0.90
                        
                        if count == 2 {
                            change.toggle()
                        }
                        
                    } // :on tap gesture
                
                Image("nuvoletta")
                    .resizable()
                    .frame(width: geometry.size.width * 0.35, height: geometry.size.width * 0.1)
                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                    .overlay(
                        Text(LocalizedStringKey(String(vignette)))
                            .scaledToFit()
                            .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.025))
                            .multilineTextAlignment(.center).padding().foregroundColor(CustomColor.selectionblue))
                    .frame(width: geometry.size.width * 0.4 ,height: geometry.size.height * 0.1, alignment: .bottom)
                    .position(x: geometry.size.width * 0.55 ,y: geometry.size.height * 0.89)
                
                
                NextStepButton().onTapGesture {
                    currentScene += 1
                }.disabled(!change)
                
                .opacity(change ? 1 : 0)
                
                
            } // :zstack
            
            
        } // :geometry reader
        
    }
    
}
