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
//    @State var degrees : Double = 0
    let layout = [
        GridItem(.flexible(minimum: 175)),
        GridItem(.flexible(minimum: 175)),
        GridItem(.flexible(minimum: 175))
    ]
    
    var body: some View {
        GeometryReader{ geometry in
        ZStack(alignment: .leading){
            
            Image("IngreBubbTop")
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width , height: geometry.size.height, alignment: .topLeading)
            
        
            
            VStack(alignment: .leading) {
                HStack{
                Text("Recipes")
                    .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.selectionblue)
                    .frame(maxWidth: .infinity, alignment: .leading) .padding(.leading,50)
                    .shadow(color: CustomColor.selectionblue, radius: 3)
                Image(avatarViewModel.getSelectedAvatar().image)
                    .resizable()
                    .scaledToFit()
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .frame( height: geometry.size.height * 0.25, alignment: .topTrailing)
                }.frame( width: geometry.size.width ,height: geometry.size.height * 0.1, alignment: .topTrailing)
                Spacer()
                LazyVGrid(columns: layout ,content: {
                    ForEach(modelView.recipesStore) { recipe in
                        NavigationLink {
                            ShowTheIngredientsView(recipe: recipe)
                        }label: {
                            RecipeCardView(recipe: recipe)
                        }
                        
                    }
                })  .frame( height: geometry.size.height * 0.45, alignment: .center)
                Spacer()

            }
            
            
            .navigationBarHidden(true)
        }
        }
    }
}

struct ChooseTheRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTheRecipeView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


