///
//  StepsView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 11/02/22.
//


import SwiftUI

struct StepsView: View {
    @EnvironmentObject var avatarViewModel : AvatarViewModel
//    @State var recipe: Recipe
    @Binding var username : String
    var recipe :Recipe
    
   var body: some View {
       GeometryReader { geometry in
        ZStack{
            Image("IngreBubbTop")
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width , height: geometry.size.height, alignment: .topTrailing)
        VStack{
            
            HStack{
                    
                    Spacer().frame(width: 20)
                NavigationLink( destination: ShowTheIngredientsView(recipe: recipe))
                    {
                        BackButtonView()
                    }
                    
                    Text("Steps")
                  .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                        .fontWeight(.bold).foregroundColor(CustomColor.selectionblue)
                        .frame(maxWidth: .infinity, alignment: .leading) .padding(.leading)
                        .shadow(color: CustomColor.selectionblue, radius: 10)
                    
                }.frame( width: geometry.size.width ,height: geometry.size.height * 0.1, alignment: .topTrailing)
//            VStack{
         
         
            StepCardView(ingredient: IngredientViewModel().ingredientsStore[10]).frame( width: geometry.size.width ,height: geometry.size.height * 0.3, alignment: .topTrailing)

              
            
            StepCardView(ingredient: IngredientViewModel().ingredientsStore[10]).frame( alignment: .trailing)
                Spacer()
             
            
//    }
           
            
            HStack{
            Circle().fill(CustomColor.bgblue).position(x: 20, y: -0)
                Circle().fill(CustomColor.bgpink).position(x: 20, y: -20)
                Circle().fill(CustomColor.bggreen).position(x: 10, y: -50)
              
            }.frame(width: 100, height: 25, alignment: .trailing).position(x: 1000, y: 690)
            
            
            
            HStack{
                Image(avatarViewModel.getSelectedAvatar().image)
                    .resizable()
                    .scaledToFit()
                    .frame( height: geometry.size.height * 0.4, alignment: .bottom)
                Image("nuvoletta") .resizable()
                    .scaledToFit()
                    .overlay(Text("Here is the list of all the steps you will have to follow!!").font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.14: geometry.size.height * 0.03)).foregroundColor(CustomColor.selectionblue).padding(10).multilineTextAlignment(.center))
                    .frame( height: geometry.size.height * 0.2, alignment: .bottom)
                
                Spacer()
                // Continue Button
                NavigationLink {
                    CreateRecipeView(recipe: recipe)
                } label: {
                    ContinueButtonView()
                } .frame(width: geometry.size.width * 0.25,height: geometry.size.height * 0.15, alignment: .bottom)
                    .padding(.trailing, 50)
                    .navigationBarHidden(true)
            }
            
                .navigationBarHidden(true)
               
        }
                      
        }

       
    }
   }
}
//        StepsView(username: $username).previewDevice("iPad Pro (11-inch) (3rd generation)")
//struct StepsView_Previews: PreviewProvider {
//    static var previews: some View {
////        StepsView(recipe:RecipeViewModel())
//        StepsView(username: $username).previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
