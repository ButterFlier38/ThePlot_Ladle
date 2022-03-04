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
            ZStack{
            if sceneViewModel.isEnvironmentNeeded(scene: scene) && !change{
                
                Image(scene.container!)
                    .resizable()
                    .scaleEffect(0.7)
                    .aspectRatio(1.2, contentMode: .fit)
                    .frame(width: geometry.size.width  ,height: geometry.size.height * 0.8, alignment: .bottomTrailing)
                    .position(x: geometry.size.width * 0.5, y:geometry.size.height * 0.48)
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
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .overlay(
                    HStack{
                        Spacer().frame(width: geometry.size.width * 0.1)
                    Image(systemName: "ipad.homebutton")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(CustomColor.selectionblue)
                            .padding()
                            .padding(3)
                            .multilineTextAlignment(.center)
                            .rotationEffect(.degrees(90))
                        Text(LocalizedStringKey("Shake your ipad to blend the ingredients!"))
                                   .scaledToFit()
                                   .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.03))
                                   .multilineTextAlignment(.center).padding().foregroundColor(CustomColor.selectionblue)
                                   
//                                    .padding().padding(10)
                    })
//                .overlay(Text("ipad.homebutton")
//                           .scaledToFit()
//                            .padding().padding(10)
//                            .multilineTextAlignment(.center)
//                          )
                .frame(width: geometry.size.width * 0.7 ,height: geometry.size.height * 0.11, alignment: .bottom)
                .position(x: geometry.size.width * 0.62, y: geometry.size.height * 0.92)
            
            // adding shaking animation on image
            }.frame(width: geometry.size.width,height: geometry.size.height)
            
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
