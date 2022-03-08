//
//  ChooseTheRecipeView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 16/02/22.
//

import SwiftUI

struct ChooseTheRecipeView: View {
    var modelView = RecipeViewModel()
    @EnvironmentObject var avatarViewModel : AvatarViewModel
    @Binding var username: String
    var recipesText :String = "Recipes"
//    var done: Bool = false
   
    //    @State var degrees : Double = 0
    let layout = [
        GridItem(.flexible(minimum: 175)),
        GridItem(.flexible(minimum: 175)),
        GridItem(.flexible(minimum: 175))
    ]
    
    var body: some View {
        GeometryReader{ geometry in
            
            Image("IngreBubbTop")
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width , height: geometry.size.height, alignment: .topLeading)
            
            VStack(alignment: .leading) {
                HStack{
                    Text(LocalizedStringKey(String(recipesText)))
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.selectionblue)
                        .frame(maxWidth: .infinity, alignment: .leading) .padding(.leading,50)
                        .shadow(color: CustomColor.selectionblue, radius: 3)
                    
                    
                    NavigationLink {
                        AvatarSelectionView(username: $username, isdone: false)
                    } label: {
                        HStack{
                            Image("nuvoletta") .resizable()
                                .scaledToFit().rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                .overlay(Text(LocalizedStringKey("Hi \(username) !")).font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.3: geometry.size.height * 0.04)).foregroundColor(CustomColor.selectionblue))
                                .frame( height: geometry.size.height * 0.15, alignment: .topTrailing)
                            Image(avatarViewModel.getSelectedAvatar().image)
                                .resizable()
                                .scaledToFit()
                                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                .frame( height: geometry.size.height * 0.25, alignment: .topTrailing)
                        }
                    }
                }.frame( width: geometry.size.width ,height: geometry.size.height * 0.1, alignment: .topTrailing)
                
                Spacer().frame(height: geometry.size.height * 0.15)
                
                LazyVGrid(columns: layout ,content: {
                    ForEach(modelView.recipesStore) { recipe in
                        NavigationLink {
                            ShowTheIngredientsView(recipe: recipe, username: $username)
                            
                        }label: {
                            RecipeCardView(recipe: recipe).grayscale(recipe.islocked ? 0.8 : 0.0)
                        }.disabled(recipe.islocked)
                        
                        
//                        NavigationLink(ShowTheIngredientsView(recipe: recipe, username: $username), tag: true, selection: recipe.locked ) {
//                            RecipeCardView(recipe: recipe)
//                             .disabled(avatarViewModel.isSomeAvatarSelected())
//                        }
                        
                        
                        
                        
                        
                    } .frame( height: geometry.size.height * 0.35, alignment: .center)
                })
                Spacer()
            }
            .navigationBarHidden(true)
        }  .edgesIgnoringSafeArea([.top,.bottom])
            .onAppear{
                SoundManager.instance.playSound("ButtonClick.mp3", spd: 0.8, vol: 0.5)
            }
    }
}

//struct ChooseTheRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChooseTheRecipeView(text: <#T##Binding<String>#>)
//            .previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}


