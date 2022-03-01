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
    @Binding var currentScene :Int
   
   
    
    var body: some View {
        GeometryReader { geometry in
                        HStack {
            
                ForEach(scene.stepIngredients!, id: \.self) { ingredient in
                    
                    if ingredient != "" {
                        
                        IngredientCardView(isDragged: $isDragged, canDrag: true, ingredient: IngredientViewModel().getIngredient(ingredient: ingredient, recipe: recipe.name)!)

//                        while (!isDragged){
////                            the botton is not there, as soon as it becomes true it has to be there
//                        }
                        
                    }
                    } // :if Statement
                    

            } //:HStack
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height , alignment: .trailing)
            .offset(x: geometry.size.width/8 , y:0)
            
            Button {
                currentScene += 1
                print(currentScene)
            } label: {
                ContinueButtonView().frame(width: geometry.size.width * 0.25,height: geometry.size.height * 0.12, alignment: .bottom)
            }

                        
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
