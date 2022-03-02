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
    
    
    
    var body: some View {
        GeometryReader { geometry in
           
                VStack{
                    
                    if sceneViewModel.isEnvironmentNeeded(scene: scene) {
                        Image(scene.container!)
                            .resizable()
                        //                                        .scaleEffect(0.7)
                            .aspectRatio(1.2, contentMode: .fit)
                            .frame(width: geometry.size.width,height: geometry.size.height , alignment: .bottomTrailing)
//                            .offset(x: geometry.size.width/30, y:geometry.size.height/9)
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
                        Circle()
                            .fill(CustomColor.selectiongreen).grayscale(0.2)
                            .frame(width: geometry.size.width * 0.5,height: geometry.size.height * 0.1, alignment: .topTrailing)
                            .overlay(  Image(systemName: "arrow.right").scaleEffect(2.5).foregroundColor(.white)

                            )
                            .opacity((dragCount == scene.stepIngredients!.count) ? 1 : 0.4)
                     
                        
                    }.position(x: geometry.size.width * 0.9 , y: geometry.size.height * 0.9)
                        .disabled(dragCount != scene.stepIngredients!.count)
//                    .frame(width: geometry.size.width * 0.15 , height: geometry.size.height * 0.1, alignment: .trailing)
                    
                    
                    //                    .position(x: geometry.size.width * 0.89 , y: geometry.size.height * 0.8)
                    
                }
                //            .frame(width: geometry.size.width , height: geometry.size.height , alignment: .trailing)
                //        .frame(
                //            width:UIScreen.main.bounds.width,
                //            height:UIScreen.main.bounds.height
                //         )
            }
        
        // :GeometryReader
    }
}

//
//struct DragAndDropView_Previews: PreviewProvider {
//    static var previews: some View {
//        DragAndDropView()
//    }
//}
