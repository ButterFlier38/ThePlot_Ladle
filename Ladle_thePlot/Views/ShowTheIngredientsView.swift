//
//  ShowTheIngredientsView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 16/02/22.
//

import SwiftUI

struct ShowTheIngredientsView: View {
    
    @EnvironmentObject var avatarViewModel : AvatarViewModel
    
    var recipe :Recipe
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack{
                //                Images used for the background
                Image("IngreBubbTop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width , height: geometry.size.height, alignment: .topTrailing)
                Image("IngreBubbBottom")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width , height: geometry.size.height, alignment: .center)
            } //:ZStack for background
            
            VStack{
                HStack{
                    Spacer().frame(width: 20)
                    NavigationLink( destination: ChooseTheRecipeView()){
                        BackButtonView()
                    }
                    
                    Text("Ingredients")
                  .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                        .fontWeight(.bold).foregroundColor(CustomColor.selectionblue)
                        .frame(maxWidth: .infinity, alignment: .leading) .padding(.leading)
                        .shadow(color: CustomColor.selectionblue, radius: 10)
                    
                }.frame( width: geometry.size.width ,height: geometry.size.height * 0.1, alignment: .topTrailing)
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(alignment: .center) {
                        // display the ingredients
                        ForEach(RecipeViewModel().getIngredients(recipe: recipe), id: \.self) { ingredient in
                            
                            if ingredient != "" {
                                IngredientCardView(ingredient: IngredientViewModel().getIngredient(ingredient: ingredient, recipe: recipe.name)!)
                            }
                        } // :ForEach for ingredients
                    } //:HStack for ingredients
                    .frame( height: geometry.size.height * 0.5, alignment: .center)
                } // :Horizontal Scroll View for ingredients
                
                
                
                // Shows the Avatar
                HStack{
                    Image(avatarViewModel.getSelectedAvatar().image)
                        .resizable()
                        .scaledToFit()
                        .frame( height: geometry.size.height * 0.4, alignment: .bottom)
                    
                    Spacer()
                    // Continue Button
                    NavigationLink {
                        StepsView()
                    } label: {
                        ContinueButtonView()
                    } .frame(width: geometry.size.width * 0.25,height: geometry.size.height * 0.15, alignment: .bottom)
                        .padding(.trailing, 50)
                        .navigationBarHidden(true)
                } // : HStack for Avatar and Continue button
                
            } // :VStack for title, ingredient scrollview and avatar continue button
            
        } // :GeometryReader
    }
}

struct ShowTheIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowTheIngredientsView(recipe: RecipeViewModel().recipesStore[1])
    }
}
