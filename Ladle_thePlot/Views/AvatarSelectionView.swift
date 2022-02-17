//
//  AvatarSelectionView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 15/02/22.
//

import SwiftUI

struct AvatarSelectionView: View {
    @StateObject private var modelView = AvatarViewModel()
    
    var body: some View {
        //        NavigationView {
        GeometryReader { geometry in
        VStack {
            // All the avatars on the top of the view
            ZStack {
                RoundedRectangle(cornerRadius: 80, style: .continuous)
                    .fill(Color.white)
                    .frame(width: 600, height: 320, alignment: .center)
                    .overlay(Image("character_tonia").scaleEffect(0.03).position(x: 430, y: 120))
                    .overlay(Image("character_giorgia").scaleEffect(0.03).position(x: 160, y: 120))
                    .overlay(Image("character_nino").scaleEffect(0.03).position(x: 250, y: 120))
                    .overlay(Image("character_gino").scaleEffect(0.03).position(x: 340, y: 120))
                    .overlay( Text("Select your avatar : ").font(Font.custom("HappyMonkey-Regular", size: 35 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue) .shadow(color: CustomColor.selectionblue, radius: 1).position(x: 300, y: 250))
            }
            // Circle creation
            HStack {
                
                ForEach(modelView.avatarsStorage) { avatar in
                    
                    Button(action:  {withAnimation(.easeOut(duration: 0.2)) {
                        modelView.toggleAvatarSelection(id: avatar.id)
                    }}){
                        
                        Circle()
                            .scaleEffect(modelView.isAvatarSelected(id: avatar.id) ? 1.2 : 1)
                            .foregroundColor(modelView.isAvatarSelected(id: avatar.id) ? Color(avatar.selectedColor) : Color.white)
                            .overlay(Circle().stroke(Color(avatar.selectedColor), lineWidth: 4)
                                        .overlay(Image(avatar.image)
                                                    .scaleEffect(modelView.isAvatarSelected(id: avatar.id) ? 0.04 : 0.029)
                                                    .clipShape(Circle().scale( modelView.isAvatarSelected(id: avatar.id) ? 0.07 : 0.06))))
                        
                    }.padding(.horizontal, 10)
                    
                } // :ForEach
            }.padding(.horizontal, 20) // :HStack
        
            // Continue button
            NavigationLink {
                ChooseTheRecipeView(username: NameInputView().$usernamee)
            } label: {
                RoundedRectangle(cornerRadius: 60, style: .continuous)
                    .fill(modelView.isSomeAvatarSelected() ?  CustomColor.selectionblue.opacity(0.4) : CustomColor.selectionblue)
                    .frame(width: 200, height: 60, alignment: .center)
                    .overlay(
                        Text("Continue").font(Font.custom("HappyMonkey-Regular", size: 25 )).foregroundColor(.white).shadow(color: .white, radius: 1))
            } // :Continue Button
            .padding(.bottom)
            .disabled(modelView.isSomeAvatarSelected())
        }}
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1))
        .frame(width: 800, height: 650, alignment: .center)
//    }
        .navigationBarHidden(true)
    }
}




struct AvatarSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarSelectionView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
