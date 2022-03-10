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
        GeometryReader{ geometry in
        RoundedRectangle(cornerRadius: 60, style: .continuous)
            .foregroundColor(Color(recipe.color))
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7)
                        .padding()
                        .overlay(Image(recipe.image).resizable().scaledToFit().opacity(recipe.image == "meatballs" ? 0.5 : 1)
                                    .padding(37)
                        )
                 .overlay(
                            RoundedRectangle(cornerRadius: 60)
                                .stroke(Color(recipe.color), lineWidth: geometry.size.width * 0.04)
//                                .padding()
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.7))
                 .overlay(Image(systemName: "lock.fill").resizable().scaledToFit().scaleEffect(0.5).foregroundColor(.white).opacity(recipe.islocked ? 1.0 : 0.0).padding(20)
//                            .position(x: 60, y: 65)
                 )
                       
        }
    }
}

//struct RecipeCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeCardView(recipe: RecipeViewModel().recipesStore[1])
//    }
//}
