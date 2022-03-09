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
    @State var dragCount = 0
    var isFinal :Bool
    @Binding var username : String
    var vignette :String
    
    var sceneViewModel :SceneViewModel = SceneViewModel()

    @State private var goToSimilarView: Bool = false
    
    
    var body: some View {
        GeometryReader { geometry in
            
                ZStack{
                    
                    if sceneViewModel.isEnvironmentNeeded(scene: scene) {
                        Image(scene.container!)
                            .resizable()
                           .aspectRatio(1.2, contentMode: .fit)
                           .frame(width: geometry.size.width * 0.9,height: geometry.size.height * 0.5 , alignment: .bottomTrailing)
                            .position(x: geometry.size.width * 0.45, y: geometry.size.height * 0.20)
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
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.3)
                    .position(x: geometry.size.width * 0.6 , y: geometry.size.height * 0.29)
//                    .offset(x: geometry.size.width/8 , y:0)
                    
                    
                    Image("nuvoletta")
                        .resizable()
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.1)
//                            .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                        .overlay(
                           Text(LocalizedStringKey(String(vignette)))
                                           .scaledToFit()
                                           .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.025))
                                           .multilineTextAlignment(.center).padding().foregroundColor(CustomColor.selectionblue)
                                      
                            )
        
                        .frame(width: geometry.size.width * 0.25 ,height: geometry.size.height * 0.1, alignment: .bottom)
                        .position(x: geometry.size.width * 0.34 ,y: geometry.size.height * 0.6)
                    
                    
                                 
//                    if !isFinal {
                        
                        NextStepButton().onTapGesture {
                            if !isFinal {
                            currentScene += 1
                            }
                            else if isFinal && dragCount == scene.stepIngredients!.count {
                                self.goToSimilarView.toggle()
                            }
                        }.disabled(dragCount != scene.stepIngredients!.count)
                        
                            .opacity((dragCount == scene.stepIngredients!.count) ? 1 : 0)
                  
                    NavigationLink(destination:  AretheysimilarView(username: $username, recipe: recipe), isActive: self.$goToSimilarView) { EmptyView() }
                    
          
                } // :Vstack
//                .offset(x: 0 , y:-geometry.size.height/4)
              
            }.onAppear {
                SoundManager.instance.playSound("NextStepSound.mp3" , spd: 1, vol: 0.5)
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
