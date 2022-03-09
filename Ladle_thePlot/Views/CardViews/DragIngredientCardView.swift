//
//  DragIngredientCardView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 02/03/22.
//

import SwiftUI

struct DragIngredientCardView: View {
    
    //    @State var scal = 0.4
    @State var dragAmount = CGSize.zero
    @State var isDragged : Bool = false
    
    var ingredient :Ingredient
    @State var pos = CGPoint(x: 10, y: 20)
    @Binding var dragCount : Int
    
    
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
                                            
                                            
                                                if !isDragged {
                                                    self.pos = CGPoint(x: $0.location.x, y: $0.location.y)
                                                    self.dragAmount = CGSize(width : $0.translation.width, height: $0.translation.height)
                                                  
                                                }
                                            
                                        }
                                        .onEnded { _ in
                                            
                                            if (pos.x > abs(UIScreen.main.bounds.width/1.8) && (pos.x < abs(UIScreen.main.bounds.width - UIScreen.main.bounds.width/7.8)) && (pos.y > abs(UIScreen.main.bounds.height/2.2)) && (pos.y < abs(UIScreen.main.bounds.height - UIScreen.main.bounds.height/7))){
                                                
                                                print("\(pos.x)")
                                                print("\(pos.y)")
                                                
                                                if !isDragged {
                                                isDragged = true
                                                dragCount += 1
                                                }
                                            } else {
                                                self.dragAmount = .zero
                                                isDragged = false
                                            }
                                            
                                            
                                            
                                            
                                        }
                                    //                                 }
                                )
                    )
                
               
            }
            
        }
    }
}



//struct DragIngredientCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DragIngredientCardView()
//    }
//}
