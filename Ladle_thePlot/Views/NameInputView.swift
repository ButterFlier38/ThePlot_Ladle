
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
    @State public var usernamee: String = "gh"
    @State public var name: String = ""
    var body: some View {
        GeometryReader { geometry in
        ZStack{
            Circle().foregroundColor(CustomColor.bgyellow).scaleEffect(0.7).position(x: 1050, y: 700)
            Circle().foregroundColor(CustomColor.bgpink).scaleEffect(0.7).position(x: 150, y: 100)
            Circle().foregroundColor(CustomColor.bggreen).scaleEffect(0.7).position(x: 150, y: 700)

            Circle().foregroundColor(CustomColor.bgblue).scaleEffect(0.7).position(x: 1050, y: 100)
            VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 80, style: .continuous)
                                .fill(Color.white)
                                .frame(width: 600, height: 320, alignment: .center)
                                .overlay(Image("character_tonia").scaleEffect(0.03).position(x: 430, y: 120))
                                .overlay(Image("character_giorgia").scaleEffect(0.03).position(x: 160, y: 120))
                                .overlay(Image("character_nino").scaleEffect(0.03).position(x: 250, y: 120))
                                .overlay(Image("character_gino").scaleEffect(0.03).position(x: 340, y: 120))
                                .overlay( Text("What's your child's name?").font(Font.custom("HappyMonkey-Regular", size: 35 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue) .shadow(color: CustomColor.selectionblue, radius: 1).position(x: 300, y: 250))
           }
           
                ZStack{
                    RoundedRectangle(cornerRadius: 60, style: .continuous)
                                    .fill(Color.white)
                                    .frame(width: 500, height: 60, alignment: .center)
                                    .overlay(
                                         RoundedRectangle(cornerRadius: 60)
                                             .stroke(CustomColor.selectionblue, lineWidth: 4))
//
//                    ChooseTheRecipeView(username: $usernamee)
//                    Accessing State's value outside of being installed on a View. This will result in a constant Binding of the initial value and will not update.
                    TextField("Input name", text: $usernamee
                         ,onCommit: {name = usernamee})
                        .frame(width: 300, height: 80, alignment: .center)
                        .font(Font.custom("HappyMonkey-Regular", size: 20))
                        .foregroundColor(CustomColor.selectionblue)
                        .shadow(color: CustomColor.bgblue, radius: 1)
                   }
                Text("\(name)").font(Font.custom("HappyMonkey-Regular", size: 70 )).fontWeight(.bold)
                    .foregroundColor(CustomColor.selectionblue)  .frame(maxWidth: .infinity, alignment: .leading) .padding(.leading,50)
                    .shadow(color: CustomColor.selectionblue, radius: 3)
                NavigationLink {
                    AvatarSelectionView()
                   
                } label: {
                    RoundedRectangle(cornerRadius: 60, style: .continuous)
                        .fill(usernamee.isEmpty ?  CustomColor.selectionblue.opacity(0.4) : CustomColor.selectionblue)
                        .frame(width: 200, height: 60, alignment: .center)
                        .overlay(
                            Text("Continue").font(Font.custom("HappyMonkey-Regular", size: 25 )).foregroundColor(.white).shadow(color: .white, radius: 1))
                }.disabled(usernamee.isEmpty)
               
               
                
            }
            }
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

