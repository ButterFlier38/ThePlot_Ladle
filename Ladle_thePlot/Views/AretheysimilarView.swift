//
//  AretheysimilarView.swift
//  Ladle_thePlot
//
//  Created by Rosa Cimmino on 17/02/22.
//

import SwiftUI
import UIKit


struct AretheysimilarView: View {
    
  
    var body: some View {
        
        GeometryReader { geometry in

            ZStack {
//                background
                RoundedRectangle(cornerRadius: 210, style: .continuous)
                    .foregroundColor(CustomColor.bggreen)
                    .ignoresSafeArea()
                
//                animation
                AnimationView()
                    .offset(x : 0, y : -500 )
                    .zIndex(0)
                
                
//                button here so it's placed always in the same place
                NavigationLink {
                 ChooseTheRecipeView()
                } label: {
                    RoundedRectangle(cornerRadius: 60, style: .continuous)
                        .fill(CustomColor.selectionblue)
                        .frame(width: 270, height: 100)
                        .overlay(
                            Text("Done").font(Font.custom("HappyMonkey-Regular", size: 37 )).foregroundColor(.white).shadow(color: .white, radius: 1))
                       
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9, alignment: .bottomTrailing)
                
                
                Image ("character_giorgia")
                        .resizable()
                        .scaleEffect(0.5)
                        .aspectRatio(0.7, contentMode: .fit)
                        .position(x: geometry.size.width * 0.14, y: geometry.size.width * 0.56)
                
                VStack{ //no timeline
                    
                    Text("Are they Similar?")
                        .font(Font.custom("HappyMonkey-Regular", size: 80 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue)  .frame(maxWidth: .infinity, alignment: .center) .padding(.leading)
                            
                
//                comparison
                
                
                    HStack (alignment: .center, spacing: 100) {
                    
                    Image("icecream1")
                            .resizable()
                            .aspectRatio(0.9, contentMode: .fit)
                        
//                        circle for the camera button
                        Circle()
                            .strokeBorder(Color.gray, lineWidth: 6)
                            .background(Circle().fill(CustomColor.bggreen))
                            .grayscale(1)
                            .overlay(
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 140.0, weight: .bold))
                                    .grayscale(1)
                                    .opacity(0.3)
                            )
                        
                    
                    
                    } .padding(30)
                        .frame(width: geometry.size.width/1.4 ,height: geometry.size.height/2)
                    
                        
                    
                    Spacer()
                    Spacer()
                    
//                    button done
                    
                   

                
                } //Close vstack
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
              
               
                
                
            }  //close the zstack
            
        } //close geometry
        
    }
}

struct AretheysimilarView_Previews: PreviewProvider {
    static var previews: some View {
        AretheysimilarView().previewDevice("iPad Pro (11-inch) (3rd generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
