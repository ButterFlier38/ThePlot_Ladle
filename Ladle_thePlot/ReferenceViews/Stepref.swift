//
//  Step1.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
//

import SwiftUI

struct Step12: View {
    @State var dragAmount = CGSize.zero
    var recipe :Recipe
    
    var body: some View {
        
        GeometryReader { geometry in
            HStack{
//                The space for the timeline
//                Rectangle().frame(width: 120, height: 400)
//               TimelineView(recipe: RecipeViewModel().recipesStore[0]))
//
        ZStack{
            RoundedRectangle(cornerRadius: 100, style: .continuous)
                .foregroundColor(CustomColor.bggreen)
                .ignoresSafeArea()
                .offset(x: geometry.size.width/9, y: 0)
            
//            i put geometry.size.width/8 as the width of the space dedicated to the timeline in the screenso that all the other measures take this dimesnion into account
         
            
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: geometry.size.width/10, y: geometry.size.height/11))
                    path.addLine(to: CGPoint(x: geometry.size.width/10, y: geometry.size.height - 50))
//                    path.move(to: CGPoint(x: 0, y: 0))
//                    path.addLine(to: CGPoint(x:0, y: 0))
                }
                .stroke(CustomColor.selectionblue, style: StrokeStyle(lineWidth: 10, dash: [20]))
        VStack{
            Text("Start")
                .font(Font.custom("HappyMonkey-Regular", size: 40))
                .foregroundColor(CustomColor.selectionblue)
//                .shadow(color: CustomColor.selectionblue, radius: 3, x: 2, y: 2)
                .position(x: geometry.size.width/18, y: geometry.size.height/10 - 10)
            
            ForEach(recipe.noofsteps, id: \.self){step in
                NavigationLink(destination: Step0()){
                    Spacer()
                ZStack{
                    
                Circle()
                   
                        Text(step.description)
                        .foregroundColor(.white)
                        .font(Font.custom("HappyMonkey-Regular", size: 30))
                    }
                .navigationViewStyle(.columns)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                }
                
//                Text("\(recipe.noofsteps)").foregroundColor(.black)
            }
        
        }.frame(width: 110, height: 950, alignment: .leading)
            }
//            .frame(width: 100, height: 900, alignment: .center)
      
        .position(x: geometry.size.width/20, y: geometry.size.width/3)
                
         
            
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
                                .scaleEffect(0.8)
                                .offset(dragAmount)
                                .zIndex(dragAmount == .zero ? 1 : 0)
//                            work on this one to drag on top of things
//                            works only on the current zstack
                            
                            
//                            drag gesture
                                .gesture(DragGesture(coordinateSpace: .global)
                                            .onChanged{ self.dragAmount = CGSize(width : $0.translation.width, height: $0.translation.height)
                                }
                                            .onEnded { _ in
                                                      self.dragAmount = .zero
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
                        .resizable()
                        .scaleEffect(0.8)
                        .aspectRatio(0.7, contentMode: .fit)
//                        .position(x: 250, y: 650)
                        .position(x: geometry.size.width/4.6, y: geometry.size.height/2.6)
                    
//                    blender
                    Circle()
//                        .resizable()
                        .scaleEffect(1.2)
//                        .aspectRatio(0.7, contentMode: .fit)
//                        .position(x: 250, y: 650)
                        .position(x: geometry.size.width/4.3, y: geometry.size.height/3)
                    
                
                }
                
            } //close the VSTack
            
        } //close the ZStack
        } //close geometry bracket
    }
    }
    }


struct Step12_Previews: PreviewProvider {
    static var previews: some View {
        Step12(recipe: RecipeViewModel().recipesStore[0])
    }
}
