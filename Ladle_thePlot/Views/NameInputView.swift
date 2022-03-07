
//
//  NameInputView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 11/02/22.
//

import SwiftUI

//Declaring all the custom colors that we use in this project
struct CustomColor {
    static let bgblue = Color("bgblue")
    static let bggreen = Color("bggreen")
    static let bgpink = Color("bgpink")
    static let bgyellow = Color("bgyellow")
    static let selectionblue = Color("selectionblue")
    static let selectiongreen = Color("selectiongreen")
    static let selectionyellow = Color("selectionyellow")
    static let selectionpink = Color("selectionpink")
    // Add more here...
}

struct NameInputView: View {
    @State public var username: String = ""
    @FocusState private var amountIsFocused: Bool
//    variables needed to do the localization
    var WhatIsYourChildName : String = "What's your child's name?"
    var Inputusername : String = "Input name"
    
    
    var body: some View {
        GeometryReader { geometry in
           
        ZStack{
            Image("Background")  .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .ignoresSafeArea()
                        .onTapGesture {amountIsFocused = false}
            
            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(.white)
//                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
                .padding(.all)
                .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.75)
                .frame(width: geometry.size.width, height: geometry.size.height)
            
                VStack{
                    ZStack{
                    Image("character_tonia")  .resizable()
                                .scaledToFit()
                                .frame( height: geometry.size.height * 0.2)
                                .offset(x: geometry.frame(in: .global).midX/4.5)
                   
                    Image("character_giorgia")  .resizable()
                                .scaledToFit()
                                .frame( height: geometry.size.height * 0.2)
                                .offset(x: -(geometry.frame(in: .global).midX/4.5))
                    Image("character_nino")  .resizable()
                                .scaledToFit()
                                .frame( height: geometry.size.height * 0.222)
                                .offset(x: geometry.frame(in: .global).midX/13)
                                
                        Image("character_gino")  .resizable()
                                    .scaledToFit()
                                    .frame( height: geometry.size.height * 0.22)
                                    .offset(x: -(geometry.frame(in: .global).midX/13))
                    }
                    Text(LocalizedStringKey(String(WhatIsYourChildName)))
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.4: geometry.size.height * 0.05))
//                                            .frame(width: geometry.size.width * 0.4,height: geometry.size.height * 0.05, alignment: .center)
                               .foregroundColor(CustomColor.selectionblue)
                               .shadow(color: CustomColor.selectionblue, radius: 1)
                    
                    
                    ZStack{
                    RoundedRectangle(cornerRadius: 60, style: .continuous)
                                    .fill(Color.white)
                                    .frame(width: geometry.size.width * 0.4,height: geometry.size.height * 0.1, alignment: .center)
                                    .overlay(
                                         RoundedRectangle(cornerRadius: 60)
                                             .stroke(CustomColor.selectionblue, lineWidth: 4))

                        
                    TextField(LocalizedStringKey(String(Inputusername)), text: $username )
                            .focused($amountIsFocused)
                            .frame(width: geometry.size.width * 0.3,height: geometry.size.height * 0.05, alignment: .trailing)
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.4: geometry.size.height * 0.03))
                        .foregroundColor(CustomColor.selectionblue)
                        .shadow(color: CustomColor.bgblue, radius: 1)
                   
                    }
                    Spacer().frame(height: geometry.size.height * 0.05)
                NavigationLink {
                    AvatarSelectionView(username: $username,done: false)
                   
                } label: {
                    ContinueButton().frame(width: geometry.size.width * 0.25,height: geometry.size.height * 0.12, alignment: .bottom).opacity(!username.isEmpty ? 1 : 0.4)
                }.disabled(username.isEmpty)
            }
          }     .frame(width: geometry.size.width * 0.8)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .navigationBarHidden(true)
        }
        
    }



}


//struct NameInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        NameInputView().previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}

