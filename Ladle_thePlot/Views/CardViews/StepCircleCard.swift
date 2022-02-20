//
//  StepCircleCard.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 20/02/22.
//

import SwiftUI

struct StepCircleCard: View {
    var ingredient :Ingredient
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0.1){
            Circle()
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.white)
                .overlay(Image(ingredient.image)
                            .scaleEffect(0.02))
            
            
   
        }.padding(.horizontal)
    }
}

struct StepCircleCard_Previews: PreviewProvider {
    static var previews: some View {
        StepCircleCard(ingredient: IngredientViewModel().ingredientsStore[10])
    }
}
