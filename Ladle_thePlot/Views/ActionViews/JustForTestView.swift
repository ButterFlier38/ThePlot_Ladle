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
          
        }.onAppear {
            SoundManager.instance.playSound("NextStepSound.mp3" , spd: 1, vol: 0.5)
        }
    }
}

//struct JustForTestView_Previews: PreviewProvider {
//    static var previews: some View {
//        JustForTestView()
//    }
//}
