//
//  ChooseTheRecipeView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 16/02/22.
//

import SwiftUI

struct ChooseTheRecipeView: View {
    @StateObject private var modelView = RecipeViewModel()
//    @Binding var name : String
    
    let layout = [
        GridItem(.flexible(minimum: 175)),
        GridItem(.flexible(minimum: 175)),
        GridItem(.flexible(minimum: 175))
    ]
    
    var body: some View {
        GeometryReader { geometry in
        ZStack(alignment: .leading){
            
            Circle().foregroundColor(CustomColor.bgpink).scaleEffect(0.4).position(x: 150, y: 0)
            Circle().foregroundColor(CustomColor.bgyellow).scaleEffect(0.5).position(x: 900, y: 80)
            Circle().foregroundColor(CustomColor.bgblue).scaleEffect(0.45).position(x: 380, y: 60)
            
            Circle().foregroundColor(CustomColor.bggreen).scaleEffect(0.5).position(x: 600, y: 120)
            
            
            VStack(alignment: .leading) {
                
                Text("Recipes").font(Font.custom("HappyMonkey-Regular", size: 70 )).fontWeight(.bold)
                    .foregroundColor(CustomColor.selectionblue)  .frame(maxWidth: .infinity, alignment: .leading) .padding(.leading,50)
                    .shadow(color: CustomColor.selectionblue, radius: 3)
               
            
                
                LazyVGrid(columns: layout ,content: {
                    ForEach(modelView.recipesStore) { recipe in
                        NavigationLink {
                            IngredientsView()
                        }label: {
                            RecipeCardView(recipe: recipe)
                        }
                        
                    }
                })
            }
            
           
            .navigationBarHidden(true)
        }
        }
        
    }
}


