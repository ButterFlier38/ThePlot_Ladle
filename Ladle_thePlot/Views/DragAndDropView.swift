//
//  DragAndDropView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 21/02/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct DragAndDropView: View {
    @State var dragAmount = CGSize.zero
    @State var isDragged = false
    var scene :RecipeScene
    var recipe :Recipe

    
    var body: some View {
        GeometryReader { geometry in
            //            VStack {
            HStack {
                ForEach(scene.stepIngredients!, id: \.self) { ingredient in
                    
                    if ingredient != "" {
                        
                        IngredientCardView(ingredient: IngredientViewModel().getIngredient(ingredient: ingredient, recipe: recipe.name)!)
                            .scaleEffect(isDragged ? 0.4 : 0.8)
                            .offset(dragAmount)
                            .zIndex(dragAmount == .zero ? 1 : 0)// drag gesture
                        
                            .gesture(DragGesture(coordinateSpace: .global)
                                        .onChanged{ self.dragAmount = CGSize(width : $0.translation.width, height: $0.translation.height)
                            }
                                        .onEnded { _ in
                                if abs(dragAmount.width) > geometry.size.width/3 {
                                    isDragged = true
                                    
                                    
                                    //                                        remove the ingredient
                                } else {
                                    self.dragAmount = .zero
                                    isDragged = false
                                }
                                
                            } //: onEnd
                            ) //:gesture
                        
                        
                        //                            } //:ifstatement ingredient
                        
                    } // :if Statement
                    
                    
                }  // :ForEach
                
                // work on this one to drag on top of things
                // works only on the current zstack
                
            } //:HStack
            .frame(width: geometry.size.width - geometry.size.width/8, height: geometry.size.height/3, alignment: .trailing)
            .offset(x: geometry.size.width/15 , y:0)
            
        } // :GeometryReader
    }
}


//struct DragAndDropView_Previews: PreviewProvider {
//    static var previews: some View {
//        DragAndDropView()
//    }
//}
