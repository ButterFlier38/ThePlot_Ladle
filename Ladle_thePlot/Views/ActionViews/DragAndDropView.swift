//
//  DragAndDropView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 21/02/22.
//

import SwiftUI
import UniformTypeIdentifiers


struct DragAndDropView: View {
    var scene :RecipeScene
    var recipe :Recipe
    @Binding var currentScene :Int
    var isFinal :Bool
    @Binding var username : String
    
    var sceneViewModel :SceneViewModel = SceneViewModel()
    
    
    @State var dragCount = 0
    @State  var move :CGFloat = 0.975

    
    
    var body: some View {
        GeometryReader { geometry in
            
                VStack{
                    
                    if sceneViewModel.isEnvironmentNeeded(scene: scene) {
                        Image(scene.container!)
                            .resizable()
                           .aspectRatio(1.2, contentMode: .fit)
                            .frame(width: geometry.size.width,height: geometry.size.height , alignment: .bottomTrailing)
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.90)
                            .padding(.top, geometry.size.height * 0.5)
                            .zIndex(0)
                        
                    }
                    HStack {
                        
                        ForEach(scene.stepIngredients!, id: \.self) { ingredient in
                            
                            if ingredient != "" {
                                
                                DragIngredientCardView( ingredient: IngredientViewModel().getIngredient(ingredient: ingredient, recipe: recipe.name)!, dragCount: $dragCount)
                                .zIndex(1)
                            }
                        } // :if Statement
                        
                        
                    } //:HStack
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height)
                    .position(x: geometry.size.width * 0.6 , y: geometry.size.height * 0.1)
//                    .offset(x: geometry.size.width/8 , y:0)
                    
                    
                    Image("nuvoletta")
                        .resizable()
//                            .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                        .overlay(
                           Text("Add the ingredients into the blender")
                                           .scaledToFit()
                                           .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.04))
                                           .multilineTextAlignment(.center).padding().foregroundColor(CustomColor.selectionblue)
                                      
                            )
        
                        .frame(width: geometry.size.width * 0.25 ,height: geometry.size.height * 0.15, alignment: .bottom)
                        .position(x: geometry.size.width * 0.35 ,y: geometry.size.height * 0.55)
                    
              
                    if !isFinal {
                        
                        Button{
                            currentScene += 1
                        }label: {
                            
                            NextStepButton() .opacity((dragCount == scene.stepIngredients!.count) ? 1 : 0)
                                
                        } .frame(width: geometry.size.width * 0.2,height: geometry.size.height * 0.2, alignment: .bottomTrailing)
                   .position(x: geometry.size.width * move, y: geometry.size.height * 0.99)
                            .disabled(dragCount != scene.stepIngredients!.count)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: move)
                            .onAppear{
                                move =  0.99
                            }
                    }
                    else if isFinal && dragCount == scene.stepIngredients!.count {
                        
                        NavigationLink {
                            AretheysimilarView(username: $username, recipe: recipe)
                        } label: {
                            NextStepButton()
                            
                        } .frame(width: geometry.size.width * 0.2,height: geometry.size.height * 0.2, alignment: .bottomTrailing)
                            .shadow(radius: move)
                            .position(x: geometry.size.width * move, y: geometry.size.height * 0.99)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: move)
                            .onAppear{
                                move =  0.99
                            }
                    } //: else if
                } // :Vstack
              
            }
        }
        
        // :GeometryReader
    }


//
//struct DragAndDropView_Previews: PreviewProvider {
//    static var previews: some View {
//        DragAndDropView()
//    }
//}
