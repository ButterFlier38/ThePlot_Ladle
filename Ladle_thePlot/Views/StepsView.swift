///
//  StepsView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 11/02/22.
//


import SwiftUI

struct StepsView: View {
    @EnvironmentObject var avatarViewModel : AvatarViewModel
    @Binding var username : String
    var recipe :Recipe
    var count = 0
    var StepsText : String = "Steps"
    var NuvolettaText : String = "Here is the list of all the steps you will have to follow!!"
    
    //   @State var colors : [Color] = [CustomColor.bggreen, CustomColor.bgyellow, CustomColor.bgblue, CustomColor.bgpink]
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack{
               
                Image("IngreBubbTop")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(13))
                    .frame(width: geometry.size.width , height: geometry.size.height, alignment: .topTrailing)
                    .position(x: geometry.size.width/2, y: geometry.size.height/3.4)
                
                
               
                
                //            dotted line
                
                //            Circle()
                //                .trim(from: 0.5, to: 0)
                //                .frame(width: geometry.size.width/3, height: geometry.size.height/3)
                
                
                Semicircle()
                //                .stroke(colors.randomElement()!, style: StrokeStyle(lineWidth: 15, lineCap: .round, dash: [4, 22]))
                    .stroke(CustomColor.bgpink, style: StrokeStyle(lineWidth: 15, lineCap: .round, dash: [4, 22]))
                    .rotationEffect(.degrees(-10))
                
                
                
                VStack{
                    
                    HStack{
                        
                        Spacer()
                            .frame(width: 20)
                        NavigationLink( destination: ShowTheIngredientsView(recipe: recipe, username: $username))
                        {
                            BackButtonView()
                        }
                        //
                        Text(LocalizedStringKey(String(StepsText)))
                            .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                            .fontWeight(.bold).foregroundColor(CustomColor.selectionblue)
                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.leading)
//                            .shadow(color: CustomColor.selectionblue, radius: 3)
                        
                    }.frame( width: geometry.size.width ,height: geometry.size.height * 0.1, alignment: .topTrailing)
                    //            VStack{
                    ScrollView(.horizontal) {
                        
                        HStack(alignment: .center, spacing: 100) {
 
                            ForEach(recipe.recipeSteps, id: \.self) { step in
                                
                                StepCardView(ingredient: IngredientViewModel().getIngredient(ingredient: recipe.ingredients[count], recipe: recipe.name)!, step: step)
                                    .frame(width: geometry.size.width / 3 ,height: geometry.size.height / 3)
                                //                .padding([.top, .leading], 50)
                                    .position(x: geometry.size.width * 0.22, y: geometry.size.height * 0.25)
                            }
                        }
                    }
                    
                    
                } //vstack
                
                Ellipse()
                    .fill(CustomColor.bggreen)
                    .position(x: geometry.size.width/8, y: geometry.size.width/1.38)
                //            smaller y goes lower,
                //                .scaleEffect(1)
                
                
                HStack{
                    Image(avatarViewModel.getSelectedAvatar().image)
                    //                Image("character_giorgia")
                        .resizable()
                        .scaledToFit()
                        .frame( height: geometry.size.height * 0.4, alignment: .bottom)
                    Image("nuvoletta") .resizable()
                        .scaledToFit()
                        .overlay(Text(LocalizedStringKey(String(NuvolettaText))).font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.14: geometry.size.height * 0.03)).foregroundColor(CustomColor.selectionblue).padding(10).multilineTextAlignment(.center))
                        .frame( height: geometry.size.height * 0.2, alignment: .bottom)
                    
                    Spacer()
                    // Continue Button
                    NavigationLink {
                        CreateRecipeView(recipe: recipe,username: $username)
                    } label: {
                        ContinueButtonView()
                    } .frame(width: geometry.size.width * 0.25,height: geometry.size.height * 0.15, alignment: .bottom)
                        .padding(.trailing, 50)
                        .navigationBarHidden(true)
                }
                
                //                .navigationBarHidden(true)
                
                .frame(width: geometry.size.width, height: geometry.size.height * 1.03, alignment: .bottom) //perfect position equal to the one in ingredients view
                
            }
            
        }
    }
}



struct Semicircle: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 4.9
        let startAngle = Angle(degrees: 340)
        let endAngle = Angle(degrees: 250)
        let clockwise = true
        
        return Path { p in
            p.addArc(center: center,
                     radius: radius,
                     startAngle: startAngle,
                     endAngle: endAngle,
                     clockwise: clockwise)
        }
    }
}


//        StepsView(username: $username).previewDevice("iPad Pro (11-inch) (3rd generation)")


//struct StepsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StepsView()
////        StepsView(username: $username).previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
