

//  CrushView.swift

//  Ladle_thePlot

//

//  Created by Jasmine Aufiero on 22/02/22.

//

import SwiftUI

struct CrushView: View {

    var image :String
    @State private var scale :CGFloat = 0.4
    @Binding var currentScene :Int

    var body: some View {
        GeometryReader { geometry in
            Image(image)
                .resizable()
                .scaleEffect(scale)
                .aspectRatio(1.2, contentMode: .fit)
                .position(x: geometry.size.width - geometry.size.width/4, y: geometry.size.height - geometry.size.height/4)

                .onTapGesture {
                    if scale < 0.7 {
                        scale += 0.1
                    }
                    
                    if scale == 0.7 { // when the tap finish, current scene would be incremented
                        currentScene += 1
                    }
                }.animation(.interpolatingSpring(stiffness: 20, damping: 2))
        }
    }
}

//struct CrushView_Previews: PreviewProvider {
//    static var previews: some View {
//        CrushView(image: "strawberry")
//    }
//}
