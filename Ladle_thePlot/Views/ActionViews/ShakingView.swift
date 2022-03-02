//
//  ShakingView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 28/02/22.
//

import SwiftUI

struct ShakingView: View {
    @Binding var currentScene :Int
    @State var change :Bool = false
    var scene :RecipeScene
    var sceneViewModel :SceneViewModel = SceneViewModel()
    @Binding var finalResultNeeded :Bool
    
    var body: some View {
        GeometryReader { geometry in
            
            if sceneViewModel.isEnvironmentNeeded(scene: scene) && !change{
                Image(scene.container!)
                    .resizable()
                    .scaleEffect(0.7)
                    .aspectRatio(1.2, contentMode: .fit)
                    .frame(width: geometry.size.width  ,height: geometry.size.height * 0.8, alignment: .bottomTrailing)
                //                        .position(x: geometry.size.width - geometry.size.width/4, y: geometry.size.height - geometry.size.height/4)
                    .offset(x: geometry.size.width/14, y:geometry.size.height/6)
                    .padding()
                    .zIndex(0)
                
            }
            else if change && scene.finalResult != nil {
                Image(scene.finalResult!)
                    .resizable()
                    .scaleEffect(0.7)
                    .aspectRatio(1.2, contentMode: .fit)
                    .frame(width: geometry.size.width  ,height: geometry.size.height * 0.8, alignment: .bottomTrailing)
                    .offset(x: geometry.size.width/14, y:geometry.size.height/6)
                    .padding()
                    .zIndex(0)
            }
            
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
                .position(x: geometry.size.width*0.2, y: geometry.size.height*0.9)
            
            // adding shaking animation on image
            
            
        }.onShake {
            // adding the final result of the recipe
            print("device shaken at this intensity")
            currentScene += 1
            change.toggle()
            finalResultNeeded.toggle()
        }
    }
        
    }
    
    




//struct ShakingView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShakingView()
//    }
//}
