
//
//  MIxView.swift
//  CircleAnimation
//
//  Created by Rosa Cimmino on 05/03/22.
//

import SwiftUI

struct MixView: View {
    @Binding var username : String
    @Binding var currentScene :Int
    var firstImage :String
    var secondImage :String
    
    @State var counter : Int = 0
    @State var change :Bool = false
    @State  var move :CGFloat = 0.975
    var isFinal :Bool
    
 
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                if !change {
                    Image(firstImage)
                        .resizable()
                        .scaleEffect(0.7)
                        .aspectRatio(1.2, contentMode: .fit)
                        .frame(width: geometry.size.width  ,height: geometry.size.height * 0.8, alignment: .bottomTrailing)
                        .position(x: geometry.size.width * 0.5, y:geometry.size.height * 0.48)
                        .padding()
                        .zIndex(0)
                    
                    MixAnimationView(counter: $counter)
                }

              
                
                
                if counter > 0 {
    //
                    ZStack{
                    Image(secondImage)
                        .resizable()
                        .scaleEffect(0.7)
                        .aspectRatio(1.2, contentMode: .fit)
                        .frame(width: geometry.size.width  ,height: geometry.size.height * 0.8, alignment: .bottomTrailing)
//                        .offset(x: geometry.size.width/14, y:geometry.size.height/6)
//                        .padding()
                        .zIndex(0).onAppear{change.toggle()}
    //                Text("The button with the animation has to appear")
                    
                    
                    
                    if !isFinal {
                        NextStepButton().onTapGesture {
                            currentScene += 1
                        }
                         }
                    
                    }
                 
                }
            }

        }.onAppear {
            SoundManager.instance.playSound("NextStepSound.mp3" , spd: 1, vol: 0.5)
        }
    }
    

        
        
    }



