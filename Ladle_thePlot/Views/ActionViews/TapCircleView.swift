
//
//  CrushView.swift
//  CircleAnimation
//
//  Created by Rosa Cimmino on 05/03/22.
//

import SwiftUI

struct TapCircleView: View {
    var body: some View {
        ZStack{
        Pulsation()
        FillingCircle()
    
        }
    }
        
}




struct FillingCircle: View{
    
    @State var fill : CGFloat = 0.0  //when this value becomes more than 1 then we can switch to the next view because the cicle is filled
    var body: some View {
       
        ZStack {
//          Circle()
//                .stroke(Color.black, style: StrokeStyle(lineWidth: 4))
             
            Circle()
                .stroke(Color.yellow,style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .overlay(
                    
                    Circle()
                        .trim(from: 0, to: self.fill)
                        .stroke(Color.green,style: StrokeStyle(lineWidth: 30, lineCap: .round))
                        .rotationEffect(.init(degrees:-90))
                        .animation(Animation.linear(duration: 1))
                )
            
            
            
            
            Text("\(self.fill)")
                .frame(width: .infinity, alignment: .center)
        }
        .padding(50)
        .onTapGesture{
          
                self.fill += 0.10
          
            
        }
        
        
    }
    
}



struct Pulsation : View{
    @State var pulsate = false
    var body: some View{
        ZStack{
            
           Circle()
//                .fill(AngularGradient(gradient: Gradient(colors: [.pink, .yellow, .green, .blue]), center: .center))
                .fill(Color.gray)
                .opacity(0.5)
                .scaleEffect(pulsate ? 1.3 : 1.1)
                .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
                .onAppear{
                    self.pulsate.toggle()
                }
            
        }
    }
}

