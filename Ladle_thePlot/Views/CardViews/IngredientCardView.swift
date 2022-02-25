//
//  IngredientCardView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
//


import SwiftUI

struct IngredientCardView: View {
//    @State var scal = 0.4
    @State var dragAmount = CGSize.zero
    @State var isDragged : Bool = false
    @State var canDrag : Bool
    var ingredient :Ingredient
    
    var body: some View {
        GeometryReader{ geometry in
        VStack(alignment: .center){
            Circle()
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
                .foregroundColor(.white)
                .overlay(Image(ingredient.image).resizable()
                            .scaledToFit()
                            .scaleEffect(self.isDragged ? 0.75 : 0.9)
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5).offset(dragAmount)
//                            .gesture(    TapGesture(count: 1).onEnded{_ in self.selected = !self.selected})
                            .gesture(
                                
                             DragGesture(coordinateSpace: .global)
                                        .onChanged{
                                            if canDrag  {
                                                if !isDragged{
                                            self.dragAmount = CGSize(width : $0.translation.width, height: $0.translation.height)
                                                }
                                            }
                          }
                                 .onEnded { _ in
                                            if (dragAmount.height) > geometry.size.height/2 && ((dragAmount.width) > geometry.size.width/5) && ((dragAmount.width) < geometry.size.width/2) {
//                                if abs(dragAmount.width) > geometry.size.width/3 {
//                    //                            NavigationLink(destination: Step1()){
                                    isDragged = true
                                } else {
                                    self.dragAmount = .zero
                                    isDragged = false
                                }

                                        }
                            )
                          )
               
            if !canDrag{
            Text(ingredient.quantity + "\n" + ingredient.name)
//                .font(Font.custom("HappyMonkey-Regular", size: 30 ))
                .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.07: geometry.size.height * 0.05))
                .fontWeight(.bold).foregroundColor(CustomColor.selectionblue)
                .multilineTextAlignment(.center)

            }
        }

    }
    }
}

struct IngredientCardView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCardView(canDrag: false,ingredient: IngredientViewModel().ingredientsStore[10]) .previewDevice("iPad Pro (11-inch) (3rd generation)")
.previewInterfaceOrientation(.landscapeLeft)
    }
}
