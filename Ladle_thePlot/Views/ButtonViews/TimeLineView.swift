//
//  TimeLineView.swift
//  Ladle_thePlot
//
//  Created by Rosa Cimmino on 22/02/22.
//

import SwiftUI

struct TimeLineView: View {
    
    //    var recipe : Recipe
    var Number_of_scenes : Int = 4 // the numebr of schene it has to come from the viewmodel recipe.scenes.count
    //recipe.scenes.count
    
    var body: some View {
        //       timeline view
        ZStack{
        ScrollView{
            VStack (alignment:.leading, spacing: 10){
                Text("Start")
                    .font(Font.custom("HappyMonkey-Regular", size: 40))
                    .foregroundColor(CustomColor.selectionblue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                    
                   
                
                ForEach(1..<Number_of_scenes + 1) { index in
                        GeometryReader { geometry in
                          
                            
                                VStack {
                                    Path { path in
                                        path.move(to: CGPoint(x: geometry.size.width / 22, y: 0))
                                        path.addLine(to: CGPoint(x: geometry.size.width / 22, y: geometry.size.width/2))
//                                        path.closeSubpath()
                                    }
                                    .stroke(style: StrokeStyle( lineWidth: 12))
                                    .foregroundColor(CustomColor.selectionblue)

                                }
                            }

                     
                            Circle()

                                    .fill(CustomColor.selectionblue)
                                    .frame(width: 70, height: 70)
                                    .overlay(Text("\(index)")
                                                .font(Font.custom("HappyMonkey-Regular", size: 30))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)

                                    )
                                    .position(x: 50, y: 0)
                                    .frame(height: 150)
                                    
             
//
                    }
                
                } //:Vstack
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding(40)
            
            Circle()
                .fill(CustomColor.selectionblue)
                .frame(width: 70, height: 70)
                .overlay(Text("done")
                            .font(Font.custom("HappyMonkey-Regular", size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)

                )
                .position(x: 50, y: 0)
                .frame(height: 150)
         
//            .coordinateSpace(name: "scroll")

            } //:scrollview
            
           
               
        } .frame( width:UIScreen.main.bounds.width, alignment: .leading)
 
            
        } //: body
    } //: view
    
    
    
    struct TimeLineView_Previews: PreviewProvider {
        static var previews: some View {
            TimeLineView()
.previewInterfaceOrientation(.landscapeLeft)
        }
    }

