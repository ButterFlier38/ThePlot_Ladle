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
            
            NextStepButton().onTapGesture {
                currentScene += 1
            }
          
        }
    }
}

//struct JustForTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        JustForTestView()
//    }
//}
