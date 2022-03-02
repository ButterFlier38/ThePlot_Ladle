//
//  NextStepButtonView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 02/03/22.
//

import SwiftUI

struct NextStepButtonView: View {
    var body: some View {
        GeometryReader { geometry in
//        RoundedRectangle(cornerRadius: 60, style: .continuous)
//            .fill(CustomColor.selectiongreen)
////                                    .frame(width: 270, height: 100)
//
//            .overlay(Image(systemName: "arrow.forward").resizable().scaleEffect(0.55).foregroundColor(.white))
//
            
            Circle()
                .fill(CustomColor.selectiongreen).grayscale(0.2)
//                .frame(width: geometry.size.width * 0.1,height: geometry.size.height * 0.1, alignment: .topTrailing)
                .overlay(  Image(systemName: "arrow.forward").resizable().scaleEffect(2.5).foregroundColor(.white)
                .position(x: geometry.size.width * 0.89 , y: geometry.size.height * 0.8)
                )
    }
    }
}

struct NextStepButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextStepButtonView()
    }
}