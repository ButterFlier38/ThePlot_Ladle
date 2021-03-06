//
//  AnimationView.swift
//  Ladle_thePlot
//
//  Created by Rosa Cimmino on 17/02/22.
//

import SwiftUI

struct AnimationView: View {
    var body: some View {
        ZStack {
            
                   Circle()
                .fill(CustomColor.selectionblue)
                       .frame(width: 20, height: 20)
                       .modifier(ParticlesModifier())
//                       .offset(x: 0, y : -50)
                   
                   Circle()
                .fill(CustomColor.selectionpink)
                       .frame(width: 20, height: 20)
                       .modifier(ParticlesModifier())
//                       .offset(x: 0, y : -20)
            Circle()
         .fill(CustomColor.selectionyellow)
                .frame(width: 20, height: 20)
                .modifier(ParticlesModifier())
//                       .offset(x: 0, y : -20)
            Circle()
         .fill(CustomColor.selectiongreen)
                .frame(width: 20, height: 20)
                .modifier(ParticlesModifier())
//                       .offset(x: 0, y : -20)
               }
    }
    
}
    struct FireworkParticlesGeometryEffect : GeometryEffect {
        var time : Double
        var speed = Double.random(in: 20 ... 200)
        var direction = Double.random(in: -Double.pi ...  Double.pi)
        
        var animatableData: Double {
            get { time }
            set { time = newValue }
        }
        func effectValue(size: CGSize) -> ProjectionTransform {
            let xTranslation = speed * cos(direction) * time
            let yTranslation = speed * sin(direction) * time
            let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
            return ProjectionTransform(affineTranslation)
        }
    }

    
    struct ParticlesModifier: ViewModifier {
        @State var time = 0.0
        @State var scale = 0.7
        let duration = 15.0
        
        func body(content: Content) -> some View {
            ZStack {
                ForEach(0..<500, id: \.self) { index in
                    content
                        .hueRotation(Angle(degrees: time * 80))
                        .scaleEffect(scale)
                        .modifier(FireworkParticlesGeometryEffect(time: time))
                        .opacity(((duration-time) / duration))
                }
            }
            .onAppear {
                withAnimation (.easeOut(duration: duration)) {
                    self.time = duration
                    self.scale = 0.4
                }
            }
        }
    }


//struct AnimationView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimationView()
//    }
//}
