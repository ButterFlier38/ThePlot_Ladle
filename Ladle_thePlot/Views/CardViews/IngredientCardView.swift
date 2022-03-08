//
//  IngredientCardView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
//


import SwiftUI

struct IngredientCardView: View {

    var ingredient :Ingredient
   
    var body: some View {
        GeometryReader{ geometry in
            VStack(alignment: .center, spacing: 0.1){
            Circle()
                .foregroundColor(.white)
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
                .overlay(Circle().stroke(CustomColor.selectionblue, lineWidth:  2))
                .overlay(Image(ingredient.image).resizable()
                            .scaledToFit()
                            .scaleEffect(0.9)
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5))
             VStack{
                    Text(LocalizedStringKey(String(ingredient.quantity)))
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.1: geometry.size.height * 0.08))
                        .fontWeight(.bold).foregroundColor(CustomColor.selectionblue)
                        .multilineTextAlignment(.center)
                    Text(LocalizedStringKey(String(ingredient.name)))
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.1: geometry.size.height * 0.08))
                        .fontWeight(.bold).foregroundColor(CustomColor.selectionblue)
                        .multilineTextAlignment(.center)
                }
        }
    }
    }
}

//struct IngredientCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        IngredientCardView(canDrag: false,ingredient: IngredientViewModel().ingredientsStore[10]) .previewDevice("iPad Pro (11-inch) (3rd generation)")
//.previewInterfaceOrientation(.landscapeLeft)
//    }
//}
