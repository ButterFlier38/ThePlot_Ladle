////
////  RecipesView.swift
////  Ladle_thePlot
////
////  Created by Irene Fernando on 11/02/22.
////
//
//import SwiftUI
//import UIKit
//
//struct RecipesView: View {
//    var modelView = RecipeViewModel()
//
//    let layout = [
//        GridItem(.flexible(minimum: 175)),
//        GridItem(.flexible(minimum: 175)),
//        GridItem(.flexible(minimum: 175))
//    ]
//
//
//
//
//    var body: some View {
//        GeometryReader { geometry in
//        ZStack{
//            Circle().foregroundColor(CustomColor.bgpink).scaleEffect(0.4).position(x: 150, y: 0)
//            Circle().foregroundColor(CustomColor.bgyellow).scaleEffect(0.5).position(x: 900, y: 80)
//            Circle().foregroundColor(CustomColor.bgblue).scaleEffect(0.45).position(x: 380, y: 60)
//
//            Circle().foregroundColor(CustomColor.bggreen).scaleEffect(0.5).position(x: 600, y: 120)
//
//
//            VStack{
//                Text("Recipes").font(Font.custom("HappyMonkey-Regular", size: 70 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue)  .frame(maxWidth: .infinity, alignment: .leading) .padding(.leading)              .shadow(color: CustomColor.selectionblue, radius: 3)
//                LazyVGrid(columns: layout ,content: {
//
//                    //            "Using 'ForEach' to return all the recipes in the RecipeList file into the LazyVGrid And using 'NavigationLink' to view the IngredientsView of the corresponding recipe"
//                    //        ****
//                    //            ForEach(recipeInfo.Recipe) { recipe in
//                    //            NavigationLink(destination: IngredientsView(recipe: recipe)) {
//                    //        ****
//
//                    //
//                    //            ForEach(recipeInfo.Recipes) { recipe in
//                    //            NavigationLink(destination: IngredientsView()) {
//                    //                RoundedRectangle(cornerRadius: 60, style: .continuous)
//                    //                                .fill(getRandomColor())
//                    //                                .frame(width: 300, height: 200, alignment: .center)
//                    //                                .padding()
//                    //    }
//                    //            }
//
//
//                    NavigationLink(destination: ShowTheIngredientsView()) {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 60, style: .continuous)
//                                .fill(CustomColor.bgblue)
//                                .frame(width: 300, height: 200, alignment: .center)
//                                .padding()
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 60)
//                                        .stroke(Color.gray, lineWidth: 4).padding())
//                            Text("Pizza")
//                        }
//                    }
//                    NavigationLink(destination: IngredientView()) {
//                        RoundedRectangle(cornerRadius: 60, style: .continuous)
//                            .fill(CustomColor.bgpink)
//                            .frame(width: 300, height: 200, alignment: .center)
//                            .padding()
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 60)
//                                    .stroke(Color.gray, lineWidth: 4).padding())
//                    }
//                    NavigationLink(destination: IngredientsView()) {
//                        RoundedRectangle(cornerRadius: 60, style: .continuous)
//                            .fill(CustomColor.bgyellow)
//                            .frame(width: 300, height: 200, alignment: .center)
//                            .padding()
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 60)
//                                    .stroke(Color.gray, lineWidth: 4).padding())
//                    }
//                    NavigationLink(destination: IngredientsView()) {
//                        RoundedRectangle(cornerRadius: 60, style: .continuous)
//                            .fill(CustomColor.bggreen)
//                            .frame(width: 300, height: 200, alignment: .center)
//                            .padding()
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 60)
//                                    .stroke(Color.gray, lineWidth: 4).padding())
//                    }
//                    NavigationLink(destination: IngredientsView()) {
//                        RoundedRectangle(cornerRadius: 60, style: .continuous)
//                            .fill(CustomColor.bgblue)
//                            .frame(width: 300, height: 200, alignment: .center)
//                            .padding()
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 60)
//                                    .stroke(Color.gray, lineWidth: 4).padding())
//                    }
//                    NavigationLink(destination: IngredientsView()) {
//                        RoundedRectangle(cornerRadius: 60, style: .continuous)
//                            .fill(CustomColor.bgpink)
//                            .frame(width: 300, height: 200, alignment: .center)
//                            .padding()
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 60)
//                                    .stroke(Color.gray, lineWidth: 4).padding())
//                    }
//                })
//                    .navigationBarHidden(true)
//            }
//        }
//        }
//    }
//}
//
//
//
//
//struct RecipesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipesView().previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
