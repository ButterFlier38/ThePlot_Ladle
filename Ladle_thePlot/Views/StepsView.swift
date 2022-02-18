///
//  StepsView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 11/02/22.
//


import SwiftUI

struct StepsView: View {
   
//    @State var recipe: Recipe
   var body: some View {
       GeometryReader { geometry in
        ZStack{
            ZStack{
            Circle().foregroundColor(CustomColor.bgyellow).scaleEffect(0.4).position(x: 1100, y: 80)
           Circle().foregroundColor(CustomColor.bgblue).scaleEffect(0.5).position(x: 800, y: 0)
            Circle().foregroundColor(CustomColor.bgpink).scaleEffect(0.45).position(x: 550, y: -30)
            Circle().foregroundColor(CustomColor.bggreen).scaleEffect(0.25).position(x: 350, y: -30)
            Circle().foregroundColor(CustomColor.bgyellow).scaleEffect(0.8).position(x: 250, y: 700)
            Circle().foregroundColor(CustomColor.bgpink).scaleEffect(0.5).position(x: 530, y: 850)
            }.frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9,alignment: .topTrailing)
        VStack{
            HStack{
                Spacer().frame(width: 20)
                NavigationLink( destination: IngredientsView()){
                    ZStack{
            Circle().foregroundColor(CustomColor.selectionblue).frame(width: 100, height: 100)
                    Image(systemName: "arrowshape.turn.up.backward.fill").scaleEffect(2.5).foregroundColor(.white)}
                }
                
        Text("Steps").font(Font.custom("HappyMonkey-Regular", size: 80 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue)  .frame(maxWidth: .infinity, alignment: .leading) .padding(.leading)              .shadow(color: CustomColor.selectionblue, radius: 10)
            }
            VStack{
            VStack(alignment: .leading){
                ZStack{
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(CustomColor.bggreen)
                .frame(width: 500, height: 200)
                .fixedSize()
                .overlay(
                    Circle().scaleEffect(0.7).foregroundColor(.white).position(x: 10, y:40)
                    
                )
                .overlay(
                   Image("latte").scaleEffect(0.01).foregroundColor(.white).position(x: 10, y:40)
                    
                )
                .overlay(
                    Circle().scaleEffect(0.7).foregroundColor(.white).position(x: 490, y:170)
                    
                )
                .overlay(
                    Text("Ice Cubes").foregroundColor(CustomColor.selectionblue).position(x: 490, y:170).font(Font.custom("HappyMonkey-Regular", size: 20))
                    
                )
                    
//                    Text("\(recipe.name)")
                    Text("Take the condensed milk and add it to the blender. Then take the ice and add it too. ").frame(width: 330, height: 150, alignment: .center).font(Font.custom("HappyMonkey-Regular", size: 25)).foregroundColor(CustomColor.selectionblue)
              
                
                
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 70)
            }
            VStack(alignment: .leading){
                ZStack{
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(CustomColor.bggreen)
                            .frame(width: 500, height: 250, alignment: .center)
                            .overlay(Circle().scaleEffect(0.6).foregroundColor(.white).position(x: 500, y:40))
                            .overlay(Image("strawberries").scaleEffect(0.01).foregroundColor(.white).position(x: 500, y:40))
                            .overlay(Circle().scaleEffect(0.5).foregroundColor(.white).position(x: 0, y:230))
                            .overlay(Image("banana").scaleEffect(0.01).foregroundColor(.white).position(x: 0, y:230))
                    Text("Now take the strawberries, wash them and cut them in half.  Repeat the process with the banana. Finally add the fruit to the blender and turn it on! ").frame(width: 400, height: 200, alignment: .center).font(Font.custom("HappyMonkey-Regular", size: 25 )).foregroundColor(CustomColor.selectionblue)
            }.frame(maxWidth: .infinity, alignment: .trailing).padding(.trailing, 70)
                
            }
           
                Spacer()
             
            }
    }
            HStack{
            Circle().fill(CustomColor.bgblue).position(x: 30, y: 10)
                Circle().fill(CustomColor.bgpink).position(x: 20, y: -10)
                Circle().fill(CustomColor.bggreen).position(x: 20, y: -10)
                Circle().fill(CustomColor.bgyellow).position(x: 20, y: 10)
                Circle().fill(CustomColor.bgblue).position(x: 10, y: 40)
                Circle().fill(CustomColor.bgpink).position(x: -10, y: 70)
                Circle().fill(CustomColor.bggreen).position(x: -40, y: 100)
            }.frame(width: 400, height: 25, alignment: .trailing).position(x: 800, y: 250)
            HStack{
            Circle().fill(CustomColor.bgblue).position(x: 20, y: -0)
                Circle().fill(CustomColor.bgpink).position(x: 20, y: -20)
                Circle().fill(CustomColor.bggreen).position(x: 10, y: -50)
              
            }.frame(width: 100, height: 25, alignment: .trailing).position(x: 1000, y: 690)
            Image ("character_giorgia")
                                .resizable()
                                .scaleEffect(0.5)
                                .aspectRatio(0.7, contentMode: .fit)
                                .position(x: 170, y: 650)
            NavigationLink {
                Step0()
//                Step1(recipe: RecipeViewModel().recipesStore[0])
//                TimelineView(recipe: RecipeViewModel().recipesStore[0])
//                CreateRecipeView()
                         } label: {
                             RoundedRectangle(cornerRadius: 60, style: .continuous)
                                 .fill(CustomColor.selectionblue)
                                 .frame(width: 270, height: 100)
                                 .overlay(
                                     Text("Continue").font(Font.custom("HappyMonkey-Regular", size: 37 )).foregroundColor(.white).shadow(color: .white, radius: 1))

                         }  .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9, alignment: .bottomTrailing)
            
                .navigationBarHidden(true)
               

                      
        }

       
    }
   }
}

struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
//        StepsView(recipe:RecipeViewModel())
        StepsView().previewDevice("iPad Pro (11-inch) (3rd generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
