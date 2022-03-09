//
//  NextViewButton.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 08/03/22.
//

import SwiftUI

struct NextStepButton: View {
    @State  var move :CGFloat = 0.93
    var body: some View {
        GeometryReader{ geometry in
        Circle()
            .fill(CustomColor.selectiongreen).grayscale(0.2)
            .overlay(Image(systemName: "arrow.forward").resizable().scaledToFit().foregroundColor(.white).scaleEffect(0.55))
            .frame(width: geometry.size.width * 0.1 , height: geometry.size.height * 0.1, alignment: .bottomTrailing)
            .position(x: geometry.size.width * move ,y: geometry.size.height * 0.93)
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: move)
            .onAppear{
                move =  0.95
            }    }
    }
}

struct NextStepButton_Previews: PreviewProvider {
    static var previews: some View {
        NextStepButton()
    }
}
