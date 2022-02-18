//
//  IngredientCardView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
//


import SwiftUI

struct IngredientCardView: View {
    var ingredient :Ingredient
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 2){
            Circle()
                .scaleEffect(1.1)
                .foregroundColor(.white)
                .overlay(Image(ingredient.image)
                            .scaleEffect(0.02))
            
            Text(ingredient.quantity + " " + ingredient.name)
                .font(Font.custom("HappyMonkey-Regular", size: 30 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.leading)
   
        }
    }
}

struct IngredientCardView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCardView(ingredient: IngredientViewModel().ingredientsStore[10])
.previewInterfaceOrientation(.landscapeLeft)
    }
}
