//
//  BackButton.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 19/02/22.
//

import SwiftUI

struct BackButtonView: View {
    var body: some View {
        
            Circle().foregroundColor(CustomColor.selectionblue).scaledToFit()
            .overlay(  Image(systemName: "arrowshape.turn.up.backward.fill").resizable().scaleEffect(0.55).foregroundColor(.white))
//                .frame(width: 100, height: 100)
          
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
    }
}
