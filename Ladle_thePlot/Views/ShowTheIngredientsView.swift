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
    @Binding var username : String
    var IngredientsText : String = "Ingredients"
    var GatherIngredients : String = "Gather the following ingredients"
    @State var angle : Double = -12.0
    @State var ang : Double = -2.0
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack{
                //                Images used for the background
                Image("IngreBubbTop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width , height: geometry.size.height, alignment: .topTrailing)
                    .ignoresSafeArea()
                Image("IngreBubbBottom")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width , height: geometry.size.height, alignment: .bottom)
                    .ignoresSafeArea()
  
            } //:ZStack for background
            
           
                    
                    VStack(alignment: .leading) {
                        Spacer().frame(height: geometry.size.height * 0.02)
                        HStack{
                            
                            NavigationLink( destination: ChooseTheRecipeView(username: $username)){
                                BackButtonView()
                            }.padding(.leading, 20)
                            
                        Text(LocalizedStringKey(String(IngredientsText)))
                            .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                            .fontWeight(.bold)
                            .foregroundColor(CustomColor.selectionblue)
                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.leading,50)
//                            .shadow(color: CustomColor.selectionblue, radius: 3)
                    
                    
                    
                }.frame(width: geometry.size.width ,height: geometry.size.height * 0.1, alignment: .topTrailing)
                
                Spacer().frame(height: geometry.size.height * 0.05)
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(alignment: .center, spacing: 20) {
                        // display the ingredients
                        ForEach(RecipeViewModel().getIngredients(recipe: recipe), id: \.self) { ingredient in
                            
                            if ingredient != "" {
                                IngredientCardView(ingredient: IngredientViewModel().getIngredient(ingredient: ingredient, recipe: recipe.name)!)
                            }
                        }.frame(width: geometry.size.width * 0.25 ,height: geometry.size.height * 0.45, alignment: .center)
                        // :ForEach for ingredients
                    }.padding(.horizontal, 30) //:HStack for ingredients
//                    .frame( height: geometry.size.height * 0.6, alignment: .center)
                } // :Horizontal Scroll View for ingredients
                
                
                
                // Shows the Avatar
                HStack{
                    Image(avatarViewModel.getSelectedAvatar().image)
                        .resizable()
                        .scaledToFit()
                        .frame( height: geometry.size.height * 0.4, alignment: .bottom)
//                        .rotationEffect(.degrees(angle))
//                        .rotation3DEffect(.degrees(angle), axis: (x: 0.2, y: 1, z: 0))
//                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: angle)
//                        .onAppear{
//                            angle = 10.0
//                        }
//                    Gather the following ingredients
                    Image("nuvoletta") .resizable()
                        .scaledToFit()
                        .overlay(Text(LocalizedStringKey(String(GatherIngredients))).font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.15: geometry.size.height * 0.03)).foregroundColor(CustomColor.selectionblue).padding(10).multilineTextAlignment(.center))
                        .frame(height: geometry.size.height * 0.2, alignment: .bottom)
//                        .rotationEffect(.degrees(-ang))
//                        .rotation3DEffect(.degrees(ang), axis: (x: -0.2, y: -1, z: 0))
//                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value:  ang)
//                        .position(x: geometry.size.width * 0.15, y: geometry.size.height * 0.2)
//                        .onAppear{
//                            ang = 10.0
//                        }
                       
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
        .edgesIgnoringSafeArea([.top,.bottom])
    }
}

//struct ShowTheIngredientsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowTheIngredientsView(recipe: RecipeViewModel().recipesStore[1], username: $username)
//    }
//}
