//
//  JustForTestView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 08/03/22.
//

import SwiftUI

struct JustForTestView: View {
    @Binding var currentScene :Int
    
    var body: some View {
        
        GeometryReader { geometry in
            Button{
                currentScene += 1
            }label: {
                
                NextStepButton()
                    
            } .frame(width: geometry.size.width * 0.2,height: geometry.size.height * 0.2, alignment: .bottomTrailing)
       .position(x: geometry.size.width, y: geometry.size.height * 0.99)
        }
    }
}

//struct JustForTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        JustForTestView()
//    }
//}
