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
   
   
    
    var body: some View {
        GeometryReader { geometry in
                        HStack {
            
                ForEach(scene.stepIngredients!, id: \.self) { ingredient in
                    
                    if ingredient != "" {
                        
                        IngredientCardView(canDrag: true, ingredient: IngredientViewModel().getIngredient(ingredient: ingredient, recipe: recipe.name)!)
                        
//                            .scaleEffect(self.selected == ingredient ? 0.4 : 0.8)
//                            .offset((self.selected == ingredient) ? .zero : dragAmount)
//                            .offset(x: self.selected == ingredient ? self.dragOffset.width : 0,
//                                    y: self.selected == ingredient ? self.dragOffset.height : 0) // CGPoint
//                            .zIndex(dragAmount == .zero ? 1 : 0)// drag gesture
//                            .gesture(
//
//
//                                DragGesture(coordinateSpace: .global)
//                                                                 .onChanged { value in
//                                                                     // Updated
//                                                                     if nil == self.selected {
//                                                                         self.selected = ingredient
//                                                                     }
//                        self.dragAmount = CGSize(width : value.translation.width, height: value.translation.height)
////                                                                     self.dragAmount = CGSize(width : $0.translation.width, height: $0.translation.height)
//
//                                                                 }
//                                                                 .updating(self.$dragOffset, body: { (value, state, transaction) in
//
//                                                                     state = value.translation
//
//                                                                 }).onEnded { _ in self.selected = nil
//                                                                     if abs(dragAmount.width) > geometry.size.width/2 && abs(dragAmount.width) < geometry.size.width {
//                                                                         isDragged = true
// } else {
//                                                                         self.dragAmount = .zero
//                                                                         isDragged = false
//                                                                     }
//
//                                                                 }
//                                                         )
                    }
                    } // :if Statement
                    
                    
//                }  // :ForEach
                
                // work on this one to drag on top of things
                // works only on the current zstack
                
            } //:HStack
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height , alignment: .trailing)
            .offset(x: geometry.size.width/8 , y:0)
            
        }
//        .frame(
//            width:UIScreen.main.bounds.width,
//            height:UIScreen.main.bounds.height
//         )
        
        // :GeometryReader
    }
}

//
//struct DragAndDropView_Previews: PreviewProvider {
//    static var previews: some View {
//        DragAndDropView()
//    }
//}
