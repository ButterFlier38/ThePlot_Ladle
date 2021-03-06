

//  CrushView.swift

//  Ladle_thePlot

//

//  Created by Jasmine Aufiero on 22/02/22.

//

import SwiftUI

struct CrushView: View {
    
    var image1 :String
    var image2 :String
    var vignette :String

    @Binding var currentScene :Int
    @State private var scale :CGFloat = 0.3
    @State var change :Bool = false
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                
                Image(change ? ((image2 != "none") ? image2 : image1) : image1)
                    .resizable()
                    .scaleEffect(scale)
                    .aspectRatio(1.2, contentMode: .fit)
                    .position(x: geometry.size.width - geometry.size.width/2.5, y: geometry.size.height * 0.5)
                    .frame(width: geometry.size.width * 0.9, alignment: .bottomTrailing)
                
                
                    .onTapGesture { // when the tap finish, current scene would be incremented
                        if scale < 0.6 {
                            scale += 0.1
                        }
                        
                        else if scale == 0.6 {
                            change.toggle()
                            scale += 0.001
                        }
                        
                    }.animation(.interpolatingSpring(stiffness: 20, damping: 2))
                    
                
                Image("nuvoletta")
                    .resizable()
                    .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: geometry.size.width * 0.35, height: geometry.size.width * 0.1)
                //                            .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                    .overlay(
                        Text(LocalizedStringKey(String(vignette)))
                            .scaledToFit()
                            .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.025))
                            .multilineTextAlignment(.center).padding().foregroundColor(CustomColor.selectionblue))
                    .frame(width: geometry.size.width * 0.25 ,height: geometry.size.height * 0.1, alignment: .bottom)
                    .position(x: geometry.size.width * 0.55 ,y: geometry.size.height * 0.89)
                
                
                NextStepButton().onTapGesture {
                    currentScene += 1
                }.disabled(!change)
                
                .opacity(change ? 1 : 0)
                
            }
            .onAppear {
                SoundManager.instance.playSound("NextStepSound.mp3" , spd: 1, vol: 0.5)
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
