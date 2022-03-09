

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
    @State  var move :CGFloat = 0.96
    @State var change :Bool = false
    var NuvolettaCrushText : String = "Tap on the dough"
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
            if !change {
                Image(image1)
                    .resizable()
                    .scaleEffect(scale)
                    .aspectRatio(1.2, contentMode: .fit)
                    .position(x: geometry.size.width - geometry.size.width/2.5, y: geometry.size.height - geometry.size.height/2.5)
                   .frame(width: geometry.size.width * 0.9, alignment: .bottomTrailing)
                   
                
                
                
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
                    .position(x: geometry.size.width - geometry.size.width/2.5, y: geometry.size.height - geometry.size.height/2.5)
                   .frame(width: geometry.size.width * 0.9, alignment: .bottomTrailing)
               
                
                
                NextStepButton().onTapGesture {
                    currentScene += 1
                }.disabled(scale != 0.7)
                   
            }
                
                Image("nuvoletta")
                    .resizable()
//                            .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                    .overlay(
                       Text(LocalizedStringKey(String(NuvolettaCrushText)))
                                       .scaledToFit()
                                       .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.025))
                                       .multilineTextAlignment(.center).padding().foregroundColor(CustomColor.selectionblue))
                    .frame(width: geometry.size.width * 0.25 ,height: geometry.size.height * 0.1, alignment: .bottom)
                    .position(x: geometry.size.width * 0.34 ,y: geometry.size.height * 0.6)
                
 
        }
//            .offset(x: 0 , y:-geometry.size.height/3)
    }
    }
}

//struct CrushView_Previews: PreviewProvider {
//    static var previews: some View {
//        CrushView(image: "strawberry")
//    }
//}
