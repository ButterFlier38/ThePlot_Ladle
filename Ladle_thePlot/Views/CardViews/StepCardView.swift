//
//  StepCardView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 20/02/22.
//

import SwiftUI

struct StepCardView: View {
//    var ingredient :Ingredient
    var index :Int
     var step :String
     var recipe :Recipe
     var ingredientViewModel :IngredientViewModel = IngredientViewModel()
    
    var body: some View {
        ZStack{
            GeometryReader{ geometry in
                
                Text(LocalizedStringKey(String(step))).font(Font.custom("HappyMonkey-Regular", size: 20))
                    .foregroundColor(CustomColor.selectionblue)
                    .multilineTextAlignment(.center)
                    .padding(25)
                    .padding()
                    .background(CustomColor.bggreen)
                    .cornerRadius(33)

                if recipe.ingredients.count > index+2 {
                    //           cirle in the right bottom corner
                    Circle()
                        .foregroundColor(.white)
                        .overlay(Circle().stroke(CustomColor.selectionblue, lineWidth:  2))
                        .overlay(
                            Image(ingredientViewModel.getIngredient(ingredient: recipe.ingredients[index], recipe: recipe.name)!.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.47)
                        ) //: overlay
                        .scaleEffect(0.5)
//                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: geometry.size.width * 0.53, y: geometry.size.height * 0.12)
                        .padding(50)
                    
                    
                    
                    
                    //                circle in the left top corner
                    Circle()
                        .foregroundColor(.white)
                        .overlay(Circle().stroke(CustomColor.selectionblue, lineWidth:  2))
                        .overlay(
                            Image(ingredientViewModel.getIngredient(ingredient: recipe.ingredients[index+2], recipe: recipe.name)!.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.47)
                            
                        )
                        .scaleEffect(0.5)
                        .offset(x: -geometry.size.width * 0.55, y: -geometry.size.height * 0.5)
                        .padding(50)
                    
                
                }
                else{
                    
                    Circle()
                        .foregroundColor(.white)
                        .overlay(Circle().stroke(CustomColor.selectionblue, lineWidth:  2))
                        .overlay(
                            Image(ingredientViewModel.getIngredient(ingredient: recipe.ingredients[index-recipe.ingredients.count], recipe: recipe.name)!.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.47)
                        ) //: overlay
                        .scaleEffect(0.5)
//                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: geometry.size.width * 0.53, y: geometry.size.height * 0.12)
                        .padding(50)
                    
                    
                    
                    
                    //                circle in the left top corner
                    Circle()
                        .foregroundColor(.white)
                        .overlay(Circle().stroke(CustomColor.selectionblue, lineWidth:  2))
                        .overlay(
                            Image(ingredientViewModel.getIngredient(ingredient: recipe.ingredients[index+2-recipe.ingredients.count], recipe: recipe.name)!.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.47)
                            
                        )
                        .scaleEffect(0.5)
                        .offset(x: -geometry.size.width * 0.55, y: -geometry.size.height * 0.5)
                        .padding(50)
     
                }

            }
        }
        
    }
}

//struct StepCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        StepCardView(index: 0, step: RecipeViewModel().recipesStore[0].recipeSteps[0], recipe: RecipeViewModel().recipesStore[0])
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
