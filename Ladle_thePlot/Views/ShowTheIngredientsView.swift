//
//  ShowTheIngredientsView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 16/02/22.
//

import SwiftUI
//extension UIScreen{
//   static let screenWidth = UIScreen.main.bounds.size.width
//   static let screenHeight = UIScreen.main.bounds.size.height
//   static let screenSize = UIScreen.main.bounds.size
//}

struct ShowTheIngredientsView: View {
    
    @EnvironmentObject var avatarViewModel : AvatarViewModel
    var recipe :Recipe
    @Binding var username : String
    @State private var ang = 0.0
    @State private var scal = 1.0
    
    
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
                    .frame(width: geometry.size.width , height: geometry.size.height, alignment: .bottom)
            } //:ZStack for background
            
           
                    
                    VStack(alignment: .leading) {
                        Spacer().frame(height: geometry.size.height * 0.02)
                        HStack{
                            
                            NavigationLink( destination: ChooseTheRecipeView(username: $username)){
                                BackButtonView()
                            }.padding(.leading, 20)
                            
                        Text("Ingredients")
                            .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                            .fontWeight(.bold)
                            .foregroundColor(CustomColor.selectionblue)
                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.leading,50)
                            .shadow(color: CustomColor.selectionblue, radius: 3)
                    
                    
                    
                }.frame(width: geometry.size.width ,height: geometry.size.height * 0.1, alignment: .topTrailing)
                
                Spacer().frame(height: geometry.size.height * 0.05)
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(alignment: .center, spacing: 50) {
                        // display the ingredients
                        ForEach(RecipeViewModel().getIngredients(recipe: recipe), id: \.self) { ingredient in
                            
                            if ingredient != "" {
                                IngredientCardView(canDrag: false , ingredient: IngredientViewModel().getIngredient(ingredient: ingredient, recipe: recipe.name)!)
                            }
                        }.frame(width: geometry.size.width * 0.25 ,height: geometry.size.height * 0.45, alignment: .center)
                        // :ForEach for ingredients
                    } //:HStack for ingredients
//                    .frame( height: geometry.size.height * 0.6, alignment: .center)
                } // :Horizontal Scroll View for ingredients
                
                
                
                // Shows the Avatar
                HStack{
                    Image(avatarViewModel.getSelectedAvatar().image)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(scal)
                        .rotation3DEffect(.degrees(ang), axis: (x: 0.2, y: 1, z: 0))
                        .frame( height: geometry.size.height * 0.4, alignment: .bottom)
                        .onAppear{withAnimation(.spring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.2).repeatForever()){
                            ang = 30.0
                            scal = 0.9
                        }}

//                    Gather the following ingredients
                    Image("nuvoletta") .resizable()
                        .scaledToFit()
                        .overlay(Text(" Gather the following ingredients").font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.15: geometry.size.height * 0.03)).foregroundColor(CustomColor.selectionblue).padding(10).multilineTextAlignment(.center))
                        .frame( height: geometry.size.height * 0.2, alignment: .bottom)
                        
                    Spacer()
                    // Continue Button
                    NavigationLink {
                        StepsView(username: $username, recipe: recipe)
                    } label: {
                        ContinueButtonView()
                    } .frame(width: geometry.size.width * 0.25,height: geometry.size.height * 0.15, alignment: .bottom)
                        .padding(.trailing, 50)
                        .navigationBarHidden(true)
                } // : HStack for Avatar and Continue button
                
            } // :VStack for title, ingredient scrollview and avatar continue button
                    
        } // :GeometryReader
        .frame(
           width:UIScreen.main.bounds.width,
           height:UIScreen.main.bounds.height
        )
    }
}

//struct ShowTheIngredientsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowTheIngredientsView(recipe: RecipeViewModel().recipesStore[1], username: $username)
//    }
//}
