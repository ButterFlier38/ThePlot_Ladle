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
        VStack(alignment: .center, spacing: 0.1){
            Circle()
//                .frame(width: 200, height: 200, alignment: .center)
//                .frame(width: geometry.size.width , height: geometry.size.height , alignment: .center)
               
                .foregroundColor(.white)
                .overlay(Image(ingredient.image).resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width, height: geometry.size.height))
            
            Text(ingredient.quantity + "\n" + ingredient.name)
//                .font(Font.custom("HappyMonkey-Regular", size: 30 ))
                .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.5: geometry.size.height * 0.5))
                .fontWeight(.bold).foregroundColor(CustomColor.selectionblue)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
   
        }.padding(.horizontal)
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7)
    }
    }
}

struct IngredientCardView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCardView(ingredient: IngredientViewModel().ingredientsStore[10])
.previewInterfaceOrientation(.landscapeLeft)
    }
}
