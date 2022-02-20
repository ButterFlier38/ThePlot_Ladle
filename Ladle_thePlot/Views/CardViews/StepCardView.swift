//
//  StepCardView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 20/02/22.
//

import SwiftUI

struct StepCardView: View {
    var ingredient :Ingredient
    var body: some View {
        ZStack{
        
        
        RoundedRectangle(cornerRadius: 30, style: .continuous)
            .fill(CustomColor.bggreen)
                        .frame(width: 300)
        //                .fixedSize()
            .overlay(
                Circle().scaleEffect(0.7).foregroundColor(.white).position(x: 10, y:40)
                
            )
            .overlay(
                Image(ingredient.image).scaleEffect(0.01).foregroundColor(.white).position(x: 10, y:40)
                
            )
            .overlay(
                Circle().scaleEffect(0.7).foregroundColor(.white).position(x: 490, y:170)
                
            )
            .overlay(
                Text("Ice Cubes").foregroundColor(CustomColor.selectionblue).position(x: 490, y:170).font(Font.custom("HappyMonkey-Regular", size: 20))
                
            )
        
        //                    Text("\(recipe.name)")
        Text("Take the condensed milk and add it to the blender. Then take the ice and add it too. ")
//            .frame(width: 330, height: 150, alignment: .center)
//            .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
            .foregroundColor(CustomColor.selectionblue)
        
        
        }
        
    }
}

struct StepCardView_Previews: PreviewProvider {
    static var previews: some View {
        StepCardView(ingredient: IngredientViewModel().ingredientsStore[10])
    }
}
