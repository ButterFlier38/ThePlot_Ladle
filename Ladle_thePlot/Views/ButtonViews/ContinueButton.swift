//
//  ContinueButtonView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 19/02/22.
//

import SwiftUI

struct ContinueButton: View {
    
    var textButton : String = "Continue"
    var body: some View {
        GeometryReader{geometry in
        RoundedRectangle(cornerRadius: 60, style: .continuous)
            .fill(CustomColor.selectionblue)
//            .frame(width: 270, height: 100)
            .overlay(
                Text(LocalizedStringKey(String(textButton)))
                    .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.4))
//                    .font(Font.custom("HappyMonkey-Regular", size: 37 ))
                    .foregroundColor(.white).shadow(color: .white, radius: 1))
    }
                }
}

struct ContinueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton()
    }
}
