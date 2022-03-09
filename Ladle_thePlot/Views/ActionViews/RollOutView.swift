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
    
    @Binding var currentScene :Int
    @State  var move :CGFloat = 0.975
    @State  var moveMattarello :CGFloat = 0.80
    @State var change :Bool = false
    
    @State var isClicked : Bool = false
    @State var count : Int = 0
   
    var body: some View{
        GeometryReader { geometry in
            ZStack {
                
                if !change {
                    
                    Image(image1)
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
                            
                            if count > 2 {
                                change.toggle()
                            }
                            
                                           
                        }

                }
                
                
                else {
                    
                        Image((image2 != "none") ? image2 : image1)
                            .resizable()
        //                    .scaleEffect(scale)
                            .aspectRatio(1.2, contentMode: .fit)
                            .position(x: geometry.size.width - geometry.size.width/2, y: geometry.size.height - geometry.size.height/2)

                    
                    Button{
                        currentScene += 1
                    }label: {
                        
                        NextStepButton()
                            
                    } .frame(width: geometry.size.width * 0.2,height: geometry.size.height * 0.2, alignment: .bottomTrailing)
               .position(x: geometry.size.width * move, y: geometry.size.height * 0.99)
    //           .disabled(scale != 0.7)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: move)
                        .onAppear{
                            move =  0.99
                        }
                } // :else
            }

 
        } // :geometry reader
        
    }
    
}
