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
    @State var denominatore = UIScreen.main.bounds.width
    @State var denominatore2 = UIScreen.main.bounds.height
    @State var pos = CGPoint(x: 10, y: 20)
    
//    let center = CGPoint(x: rect.midX, y: rect.midY)
    
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
                                            self.pos = CGPoint(x: $0.location.x, y: $0.location.y)
                                            if canDrag  {
                                                if !isDragged{
                                            self.dragAmount = CGSize(width : $0.translation.width, height: $0.translation.height)
//                                                    self.dragAmount = CGPoint(x : $0.translation.width, y : $0.translation.height)
                                                }
                                            }
                          }
                                 .onEnded { _ in
                                     
                                     denominatore = dragAmount.width < UIScreen.main.bounds.width/3 ? dragAmount.width*0.019 : dragAmount.width * 3 //35
                                     denominatore2 = dragAmount.height < UIScreen.main.bounds.height/3 ? dragAmount.height : dragAmount.height * 4.6
                                    
//                                     if ((-dragAmount.width) < abs(UIScreen.main.bounds.width/denominatore)) && ((-dragAmount.height) < abs(UIScreen.main.bounds.height/denominatore2)){
////                                         denominatore = dragAmount.width
                                         
                                         
                                     if (pos.x > abs(UIScreen.main.bounds.width/1.8) && (pos.x < abs(UIScreen.main.bounds.width - UIScreen.main.bounds.width/7.8)) && (pos.y > abs(UIScreen.main.bounds.height/2.2)) && (pos.y < abs(UIScreen.main.bounds.height - UIScreen.main.bounds.height/7))){
                                         
//                                         print("\(dragAmount.width)")
//                                         print("\(dragAmount.height)")
//                                         print("\(UIScreen.main.bounds.height / denominatore2)")
//
                                    print("\(pos.x)")
                                    print("\(pos.y)")
                                             
                        
                                         

                                    isDragged = true
                                } else {
                                    self.dragAmount = .zero
                                    isDragged = false
                                }

                                        }
//                                 }
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

//struct IngredientCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        IngredientCardView(canDrag: false,ingredient: IngredientViewModel().ingredientsStore[10]) .previewDevice("iPad Pro (11-inch) (3rd generation)")
//.previewInterfaceOrientation(.landscapeLeft)
//    }
//}
