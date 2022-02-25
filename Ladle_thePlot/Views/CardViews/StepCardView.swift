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
            GeometryReader{ geometry in
        
        RoundedRectangle(cornerRadius: 33, style: .continuous)
            .fill(CustomColor.bggreen)
            .frame(width: geometry.size.width, height: geometry.size.height * 3/4, alignment: .center)
            .overlay(
            Text("Take the condensed milk and add it to the blender. Then take the ice and add it too. ")
                 .foregroundColor(CustomColor.selectionblue)
                .font(Font.custom("HappyMonkey-Regular", size: 20))
                .multilineTextAlignment(.center)
                .padding(20)
            ) //:overlay
            
                       
      

//           cirle in the right bottom corner
                Circle()
                    .overlay(
                    Image("icecubes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.47)
                    ) //: overlay
                    .foregroundColor(.white)
                    .scaleEffect(0.5)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: geometry.size.width * 0.4, y: geometry.size.height * 0.12)
                    .padding(50)
                   
                
                
                
//                circle in the left top corner
                Circle()
                    .overlay(
                    Image("strawberry")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.47)
                        
                    )
                    .foregroundColor(.white)
                    .scaleEffect(0.6)
                    .offset(x: -geometry.size.width * 0.47, y: -geometry.size.height * 0.5)
                    .padding(50)
               
        
            }
        }
        
    }
}

struct StepCardView_Previews: PreviewProvider {
    static var previews: some View {
        StepCardView(ingredient: IngredientViewModel().ingredientsStore[10])
.previewInterfaceOrientation(.landscapeLeft)
    }
}
