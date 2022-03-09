//
//  MixAnimationview.swift
//  Ladle_thePlot
//
//  Created by Rosa Cimmino on 08/03/22.
//

import Foundation
import SwiftUI

struct MixAnimationView : View{
    
    @State var temperatureValue: CGFloat = 0.0
    @State var angleValue: CGFloat = 0.0
    @Binding var counter : Int
    
    
    
    let config = Config(minimumValue: 0.0,
                        maximumValue: 40.0,
                        totalValue: 40.0,
                        knobRadius: 15.0,
                        radius: 125.0
    )
    var body: some View{
        
        
        //            background dashed line
        Circle()
            .stroke(Color.gray,
                    style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [3, 23.18]))
            .frame(width: config.radius * 2, height: config.radius * 2)
        
        
        //            the circle that fills with the drag gesture
        Circle()
            .trim(from: 0.0, to: temperatureValue/config.totalValue)
            .stroke(temperatureValue < (config.maximumValue * 4/5) ? CustomColor.selectionblue : CustomColor.selectiongreen,  style: StrokeStyle(lineWidth: 30,lineCap: .round))
            .frame(width: config.radius * 1.5, height: config.radius * 1.5)
        
            .rotationEffect(.degrees(-90))
        
        //            the dots that starts the circle
        Image("woodspoon")
            .resizable()
            .rotationEffect(.degrees(90))
            .frame(width: config.knobRadius * 5.5, height: config.knobRadius * 15.5)
            .padding(10)
            .offset(y: -config.radius)
            .rotationEffect(Angle.degrees(Double(angleValue)))
            .gesture(DragGesture(minimumDistance: 0.0)
                        .onChanged({ value in
                change(location: value.location)
                
                
                if  (temperatureValue > 39) {
                    //                        if you use 39.9 it becomes more sensible
                    counter += 1
                }
                
                
            })
                     
            ) // :drag gesture
        
    }
    
    func change(location: CGPoint) {
        
        // creating vector from location point
        let vector = CGVector(dx: location.x, dy: location.y)
        
        // getting angle in radian need to subtract the knob radius and padding from the dy and dx
        let angle = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10)) + .pi/2.0
        
        // convert angle range from (-pi to pi) to (0 to 2pi)
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        
        
        // convert angle value to temperature value
        let value = fixedAngle / (2.0 * .pi) * config.totalValue
        
        temperatureValue = value
        angleValue = fixedAngle * 180 / .pi // converting to degree
        
        
    }
}




struct Config {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
    let knobRadius: CGFloat
    let radius: CGFloat
}
