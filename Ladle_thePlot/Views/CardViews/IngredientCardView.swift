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
        GeometryReader{ geometry in
        VStack(alignment: .center){
            Circle()
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
                .foregroundColor(.white)
                .overlay(Image(ingredient.image).resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5))
            
            Text(ingredient.quantity + "\n" + ingredient.name)
//                .font(Font.custom("HappyMonkey-Regular", size: 30 ))
                .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.07: geometry.size.height * 0.05))
                .fontWeight(.bold).foregroundColor(CustomColor.selectionblue)
                .multilineTextAlignment(.center)

   
        }

    }
    }
}

struct IngredientCardView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCardView(ingredient: IngredientViewModel().ingredientsStore[10]) .previewDevice("iPad Pro (11-inch) (3rd generation)")
.previewInterfaceOrientation(.landscapeLeft)
    }
}
