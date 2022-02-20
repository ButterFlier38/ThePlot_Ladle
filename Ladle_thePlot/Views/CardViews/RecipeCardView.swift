//
//  RecipeCardView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 16/02/22.
//

import SwiftUI

struct RecipeCardView: View {
    var recipe :Recipe
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 60, style: .continuous)
            .foregroundColor(Color(recipe.color))
                        .frame(height: 200, alignment: .center)
//        width: 300, 
                        .padding()
                        .overlay(Image(recipe.image[0]).resizable().scaledToFit().padding(37))
                       .overlay(
                            RoundedRectangle(cornerRadius: 60)
                                .stroke(Color(recipe.color), lineWidth: 25).padding())
                       

    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: RecipeViewModel().recipesStore[1])
    }
}
