//
//  ShowTheIngredientsView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 16/02/22.
//

import SwiftUI

struct ShowTheIngredientsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var avatarViewModel : AvatarViewModel
    
    var recipe :Recipe

    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack{
                Circle().foregroundColor(CustomColor.bggreen).scaleEffect(0.57).position(x: 650, y: 170)
                Circle().foregroundColor(CustomColor.bgblue).scaleEffect(0.45).position(x: 370, y: 80)
                Circle().foregroundColor(CustomColor.bgpink).scaleEffect(0.35).position(x: 1100, y: 60)
                Circle().foregroundColor(CustomColor.bgyellow).scaleEffect(0.45).position(x: 900, y: 100)
                
                
                Ellipse().foregroundColor(CustomColor.bggreen)
                    .scaleEffect(1.2).position(x: 570, y: 950)
                
                VStack{
                    
                    HStack {
                        
                        NavigationLink {
                            ChooseTheRecipeView()
                        }label: {
                            Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .topLeading)
                                .foregroundColor(Color("accentColor"))
                                .padding(.leading, 50)
                            
                        }.frame(width: 100, height: 100, alignment: .topLeading)
                        

                    } //:HStack
                    
                    ScrollView(.horizontal, showsIndicators: false){

                        HStack {
                            // display the ingredients
                            ForEach(RecipeViewModel().getIngredients(recipe: recipe), id: \.self) { ingredient in
                                
                                if ingredient != "" {
                                    IngredientCardView(ingredient: IngredientViewModel().getIngredient(ingredient: ingredient, recipe: recipe.name)!)
                                }
                            } // :ForEach for ingredients
                        } //:HStack for ingredients

                    } // :Horizontal Scroll View for ingredients
                } // :VStack
                
//                // Shows the Avatar
                Image(avatarViewModel.getSelectedAvatar().image)
                        .resizable()
                        .scaleEffect(0.5)
                        .aspectRatio(0.7, contentMode: .fit)
                        .position(x: 170, y: 650)
                
                // Continue Button
                NavigationLink {
                  StepsView()
                } label: {
                    RoundedRectangle(cornerRadius: 60, style: .continuous)
                        .fill(CustomColor.selectionblue)
                        .frame(width: 270, height: 100)
                        .overlay(
                            Text("Continue").font(Font.custom("HappyMonkey-Regular", size: 37 )).foregroundColor(.white).shadow(color: .white, radius: 1))
                       
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9, alignment: .bottomTrailing)
                
            } // :ZStack
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItem(placement:.principal){
                Text("Ingredients")
                    .font(Font.custom("HappyMonkey-Regular", size: 80))
                    .foregroundColor(CustomColor.selectionblue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .shadow(color: CustomColor.selectionblue, radius: 10)
            }
        }
        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9, alignment: .topLeading)
        
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                ZStack{
                    Circle().foregroundColor(CustomColor.selectionblue).frame(width: 100, height: 100)
                    Image(systemName: "arrowshape.turn.up.backward.fill").scaleEffect(2.5).foregroundColor(.white)}
            })
        } // :GeometryReader
    }
}

struct ShowTheIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowTheIngredientsView(recipe: RecipeViewModel().recipesStore[1])
    }
}
