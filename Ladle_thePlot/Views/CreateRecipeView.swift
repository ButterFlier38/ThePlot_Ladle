//
//  CreateRecipeView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 11/02/22.
//

import SwiftUI



struct CreateRecipeView: View {
    
    @State var dragAmount = CGSize.zero
    @State var isDragged : Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            HStack{
//                The space for the timeline
//                Rectangle().frame(width: 120, height: 400)
//               TimelineView(recipe: RecipeViewModel().recipesStore[0]))
//
        ZStack{
            RoundedRectangle(cornerRadius: 50, style: .continuous)
                .foregroundColor(CustomColor.bggreen)
                .ignoresSafeArea()
                .offset(x: geometry.size.width/8, y: 0)
            
//            i put geometry.size.width/8 as the width of the space dedicated to the timeline in the screenso that all the other measures take this dimesnion into account
            
            Text("Start")
                .font(Font.custom("HappyMonkey-Regular", size: 40))
                .foregroundColor(CustomColor.selectionblue)
//                .shadow(color: CustomColor.selectionblue, radius: 3, x: 2, y: 2)
                .position(x: geometry.size.width/18, y: geometry.size.height/20 - 20)
            
//            timeline dotted line
            Path { path in
                path.move(to: CGPoint(x: geometry.size.width/20, y: geometry.size.height/11))
                path.addLine(to: CGPoint(x: geometry.size.width/20, y: geometry.size.height - 50))

            }
            .stroke(CustomColor.selectionblue, style: StrokeStyle(lineWidth: 10, dash: [20]))
            
            
//            timeline
            VStack (alignment: .trailing, spacing: 2){
                
              
                    

                Group {
//               for in in steps yit needs to print the number in the circle
                    Circle()
                        .overlay(
                    Text("1")
                        .font(Font.custom("HappyMonkey-Regular", size: 80))
                        .foregroundColor(.white)
                        )
                    Circle()
                        .overlay(
                    Text("2")
                        .font(Font.custom("HappyMonkey-Regular", size: 80))
                        .foregroundColor(.white)
                        )
                    Circle()
                        .overlay(
                    Text("3")
                        .font(Font.custom("HappyMonkey-Regular", size: 80))
                        .foregroundColor(.white)
                        )
                    Circle()
                        .overlay(
                    Text("4")
                        .font(Font.custom("HappyMonkey-Regular", size: 80))
                        .foregroundColor(.white)
                        )
                    Circle()
                        .overlay(
                    Text("5")
                        .font(Font.custom("HappyMonkey-Regular", size: 80))
                        .foregroundColor(.white)
                        )
                }
                .scaleEffect(0.5)
                .foregroundColor(CustomColor.selectionblue)
                
            }.position(x: geometry.size.width/20, y: geometry.size.width/3)
            
            
            
            Image("blender")
                    .resizable()
                    .scaleEffect(0.5)
                    .aspectRatio(1.2, contentMode: .fit)
                    .position(x: geometry.size.width - geometry.size.width/4, y: geometry.size.height - geometry.size.height/4)
            
            
            VStack (spacing:2) {
                
                Text("Let's make it!")
                    .font(Font.custom("HappyMonkey-Regular", size: 80))
                    .foregroundColor(CustomColor.selectionblue)
                
                HStack(spacing:8){
                    
//                    ingredients to drag and drop

                    Group{
                        ZStack{
                        Circle()
                            Image("latte")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(isDragged ? 0.4 : 0.8)
                                .offset(dragAmount)
                                .zIndex(dragAmount == .zero ? 1 : 0)
//                            work on this one to drag on top of things
//                            works only on the current zstack
                            
                            
//                            drag gesture
                                .gesture(DragGesture(coordinateSpace: .global)
                                            .onChanged{ self.dragAmount = CGSize(width : $0.translation.width, height: $0.translation.height)
                                }
                                            .onEnded { _ in
                                    if abs(dragAmount.width) > geometry.size.width/3 {
                                        isDragged = true
                                        
                                        
//                                        remove the ingredient
                                    } else {
                                        self.dragAmount = .zero
                                        isDragged = false
                                    }
                                  
                                }
                                )
//
                        }
                        ZStack{
                        Circle()
                            Image("character_tonia")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.8)
                        }
                        
                        ZStack{
                        Circle()
                            Image("strawberries")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.8)
                        }
                        
                        ZStack{
                        Circle()
                            Image("banana")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.8)
                        }
                    
                    
                    }
                    .foregroundColor(.white)
                    
                } //close Hstack
                .frame(width: geometry.size.width - geometry.size.width/8, height: geometry.size.height/3, alignment: .trailing)
                .offset(x: geometry.size.width/15 , y:0)
                
//                avatar
                
                
                HStack{
                Image ("character_giorgia")
                    //                    if the character avatar is tonia we should put a scale affetc = 0.9 or 1 because she is stretched with 0.8 (maybe create a variable with a ternary operator that manages the scale effect)
                        .resizable()
                        .scaleEffect(0.8)
                        .aspectRatio(0.7, contentMode: .fit)
//                        .position(x: 250, y: 650)
                        .position(x: geometry.size.width/4.3, y: geometry.size.height/2.6)
                    

                }
                
            } //close the VSTack
            
        } //close the ZStack
        } //close geometry bracket
    }
    }
}

struct CreateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipeView().previewDevice("iPad Pro (11-inch) (3rd generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
