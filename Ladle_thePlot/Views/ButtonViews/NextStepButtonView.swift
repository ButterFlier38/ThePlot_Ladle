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
            
            
            Circle()
                .fill(CustomColor.selectiongreen).grayscale(0.2)
                .overlay(Image(systemName: "arrow.forward").resizable().scaledToFit().foregroundColor(.white).scaleEffect(0.55))
        }
    }
}

struct NextStepButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextStepButtonView()
            .previewDevice("iPad (9th generation)")
    }
}
