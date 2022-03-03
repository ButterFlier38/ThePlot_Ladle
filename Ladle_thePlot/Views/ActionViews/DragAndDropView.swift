//
//  DragAndDropView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 21/02/22.
//

import SwiftUI
import UniformTypeIdentifiers


//extension UIScreen{
//   static let screenWidth = UIScreen.main.bounds.size.width
//   static let screenHeight = UIScreen.main.bounds.size.height
//   static let screenSize = UIScreen.main.bounds.size
//}


struct DragAndDropView: View {
    @GestureState private var dragOffset = CGSize.zero
    @State private var selected: String? = nil
    @State var dragAmount = CGSize.zero
    @State var isDragged = false
    var scene :RecipeScene
    var recipe :Recipe
    var sceneViewModel :SceneViewModel = SceneViewModel()
    @Binding var currentScene :Int
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
                                
                                //                        while (!isDragged){
                                //                          the botton is not there, as soon as it becomes true it has to be there
                                //                        }
                                
                            }
                        } // :if Statement
                        
                        
                    } //:HStack
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height)
                    .position(x: geometry.size.width * 0.6 , y: geometry.size.height * 0.1)
//                    .offset(x: geometry.size.width/8 , y:0)
                    
                    
                    
                    
              
                    
                    Button{
                        currentScene += 1
                    }label: {
                        
                        NextStepButtonView() .opacity((dragCount == scene.stepIngredients!.count) ? 1 : 0)
                            
                    } .frame(width: geometry.size.width * 0.2,height: geometry.size.height * 0.2, alignment: .bottomTrailing)
               .position(x: geometry.size.width * move, y: geometry.size.height * 0.99)
                        .disabled(dragCount != scene.stepIngredients!.count)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: move)
                        .onAppear{
                            move =  0.99
                        }
                    
  
                }
              
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
