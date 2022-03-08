

//  CrushView.swift

//  Ladle_thePlot

//

//  Created by Jasmine Aufiero on 22/02/22.

//

import SwiftUI

struct CrushView: View {

    var image1 :String
    var image2 :String
    @State private var scale :CGFloat = 0.4
    @Binding var currentScene :Int
    @State  var move :CGFloat = 0.975
    @State var change :Bool = false

    var body: some View {
        GeometryReader { geometry in

            if !change {
                Image(image1)
                    .resizable()
                    .scaleEffect(scale)
                    .aspectRatio(1.2, contentMode: .fit)
                    .position(x: geometry.size.width - geometry.size.width/2, y: geometry.size.height - geometry.size.height/2)

                    .onTapGesture {
                        if scale < 0.7 {
                            scale += 0.1
                        }
                        
                        else { // when the tap finish, current scene would be incremented
                            change.toggle()
                        }
                    }.animation(.interpolatingSpring(stiffness: 20, damping: 2))
            }
            
            else {
                Image(image2)
                    .resizable()
                    .scaleEffect(scale)
                    .aspectRatio(1.2, contentMode: .fit)
                    .position(x: geometry.size.width - geometry.size.width/2, y: geometry.size.height - geometry.size.height/2)
                
                Button{
                    currentScene += 1
                }label: {
                    
                    NextStepButton()
                        
                } .frame(width: geometry.size.width * 0.2,height: geometry.size.height * 0.2, alignment: .bottomTrailing)
           .position(x: geometry.size.width * move, y: geometry.size.height * 0.99)
           .disabled(scale != 0.7)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: move)
                    .onAppear{
                        move =  0.99
                    }
            }
        }
    }
}

//struct CrushView_Previews: PreviewProvider {
//    static var previews: some View {
//        CrushView(image: "strawberry")
//    }
//}
