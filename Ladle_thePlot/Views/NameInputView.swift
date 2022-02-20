
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
    @State public var usernamee: String = ""
    @State public var name: String = ""
    var body: some View {
        GeometryReader { geometry in
        ZStack{
  
                VStack{
                    ZStack{
                    Image("character_tonia")  .resizable()
                                .scaledToFit()
                                .frame( height: geometry.size.height * 0.2).offset(x: 110)
                   
                   
                    Image("character_giorgia")  .resizable()
                                .scaledToFit()
                                .frame( height: geometry.size.height * 0.2).offset(x: -110)
                  
                    Image("character_nino")  .resizable()
                                .scaledToFit()
                                .frame( height: geometry.size.height * 0.222).offset(x: 35)
                        Image("character_gino")  .resizable()
                                    .scaledToFit()
                                    .frame( height: geometry.size.height * 0.22).offset(x: -35)
                    }
                    Text("What's your child's name?")
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
//
//                    ChooseTheRecipeView(username: $usernamee)
//                    Accessing State's value outside of being installed on a View. This will result in a constant Binding of the initial value and will not update.
                    TextField("Input name", text: $usernamee
                         ,onCommit: {name = usernamee})
                            .frame(width: geometry.size.width * 0.3,height: geometry.size.height * 0.05, alignment: .trailing)
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.4: geometry.size.height * 0.03))
                        .foregroundColor(CustomColor.selectionblue)
                        .shadow(color: CustomColor.bgblue, radius: 1)
                   
                    }
                    Spacer().frame(height: geometry.size.height * 0.05)
                NavigationLink {
                    AvatarSelectionView()
                   
                } label: {
                    ContinueButtonView() .frame(width: geometry.size.width * 0.25,height: geometry.size.height * 0.12, alignment: .bottom).opacity(!usernamee.isEmpty ? 1 : 0.4)
                    
                    
//                    RoundedRectangle(cornerRadius: 60, style: .continuous)
//                        .fill(usernamee.isEmpty ?  CustomColor.selectionblue.opacity(0.4) : CustomColor.selectionblue)
//                        .frame(width: 200, height: 60, alignment: .center)
//                        .overlay(
//                            Text("Continue").font(Font.custom("HappyMonkey-Regular", size: 25 )).foregroundColor(.white).shadow(color: .white, radius: 1))
                }.disabled(usernamee.isEmpty)
               
                
//                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5))
                
            }.overlay(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
                    .padding(.all).frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.75)
                    .frame(width: geometry.size.width, height: geometry.size.height))
//
            }     .frame(width: geometry.size.width * 0.8)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .navigationBarHidden(true)
        }
    }



}




//****** PREVIOUS DESIGN *****

//struct NameInputView: View {
//    @State private var username: String = ""
//    var body: some View {
//        ZStack{
//            Circle().foregroundColor(CustomColor.bgyellow).scaleEffect(0.8).position(x: 550, y: 400)
//            Circle().foregroundColor(CustomColor.bgpink).scaleEffect(0.6).position(x: 250, y: 100)
//            Circle().foregroundColor(CustomColor.bggreen).scaleEffect(0.8).position(x: 1000, y: 200)
//
//            Circle().foregroundColor(CustomColor.bgblue).scaleEffect(0.6).position(x: 600, y: 80)
//            Image("character_tonia").scaleEffect(0.03).position(x: 720, y: 100)
//            Image("character_giorgia").scaleEffect(0.03).position(x: 460, y: 100)
//            Image("character_nino").scaleEffect(0.03).position(x: 550, y: 120)
//            Image("character_gino").scaleEffect(0.03).position(x: 640, y: 125)
//           Spacer()
//            VStack {
//                Text("What's your child's name?").font(Font.custom("HappyMonkey-Regular", size: 30 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue) .shadow(color: CustomColor.selectionblue, radius: 1)
//
//
//                ZStack{
//                    RoundedRectangle(cornerRadius: 30, style: .continuous)
//                                    .fill(Color.white)
//                                    .frame(width: 300, height: 80, alignment: .center)
//
//                    TextField("Input name", text: $username).frame(width: 300, height: 80, alignment: .center).font(Font.custom("HappyMonkey-Regular", size: 20)).foregroundColor(CustomColor.selectionblue) .shadow(color: CustomColor.bgblue, radius: 1)
//                   }
//            }
//        }
//    }
//}
//
//  *********

struct NameInputView_Previews: PreviewProvider {
    static var previews: some View {
        NameInputView().previewDevice("iPad Pro (11-inch) (3rd generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

