//
//  AvatarSelectionView.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 15/02/22.
//

import SwiftUI
import UIKit

struct AvatarSelectionView: View {
    @EnvironmentObject var avatarViewModel : AvatarViewModel
    @Binding var username : String
    @State var iConName : String = ""
    @State var done : Bool
    var chooseYourAvatar : String = "Choose your avatar: "
    
    
    func changeIconName(to iconName: String) {
        if avatarViewModel.getSelectedAvatar().name != iConName.lowercased(){
        switch avatarViewModel.getSelectedAvatar().name {
        case "nino" :
            iConName = "Nino"
        case "tonia" :
            iConName = "Tonia"
        case "giorgia" :
            iConName = "Giorgia"
        case "gino" :
            iConName = "Gino"
        default:
            print(iConName)
        }
            getIcon(to: iConName)
            done = false
        }else{done.toggle()}
       
    }
    
    
    func getIcon(to iconName: String) {
       guard UIApplication.shared.supportsAlternateIcons else {
            return
        }
        UIApplication.shared.setAlternateIconName(iconName, completionHandler: { (error) in
            if let error = error {
                print("App icon failed to change due to \(error.localizedDescription)")
            } else {
                print("App icon changed successfully")
                //            done.toggle()
            }
        })
    }
    
    
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .ignoresSafeArea()
                RoundedRectangle(cornerRadius: 25, style: .continuous).fill(.white)
                //                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
                    .padding(.all).frame(width: geometry.size.width * 0.75, height: geometry.size.height * 0.9)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                VStack {
                    // All the avatars on the top of the view
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
                    
                    Text(LocalizedStringKey(String(chooseYourAvatar)))
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.4: geometry.size.height * 0.05))
                        .foregroundColor(CustomColor.selectionblue)
                        .shadow(color: CustomColor.selectionblue, radius: 1)
                    // Circle creation
                    HStack {
                        
                        ForEach(avatarViewModel.avatarsStorage) { avatar in
                            
                            Button(action:  {withAnimation(.easeOut(duration: 0.2)) {
                                avatarViewModel.toggleAvatarSelection(id: avatar.id)
                            }}){
                                
                                Circle()
                                    .scaleEffect(avatarViewModel.isAvatarSelected(id: avatar.id) ? 1.2 : 1)
                                    .foregroundColor(avatarViewModel.isAvatarSelected(id: avatar.id) ? Color(avatar.selectedColor) : Color.white)
                                    .overlay(Circle().stroke(Color(avatar.selectedColor), lineWidth: 4)
                                                .overlay(Image(avatar.image).resizable().scaledToFit()
                                                            .scaleEffect(avatarViewModel.isAvatarSelected(id: avatar.id) ? 0.9 : 0.69)
                                                            .clipShape(Circle().scale( avatarViewModel.isAvatarSelected(id: avatar.id) ? 1.2 : 0.98))))
                            }.padding(.horizontal, 10)
                            
                        } // :ForEach
                    }.padding(.horizontal, 20) // :HStack
                        .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 0.28)
                    
                    // Continue button
                    NavigationLink {
                        ChooseTheRecipeView(username: $username)
                    } label: {
                        
                        ContinueButton().frame(width: geometry.size.width * 0.25,height: geometry.size.height * 0.12, alignment: .bottom).opacity(!avatarViewModel.isSomeAvatarSelected() ? 1 : 0.4)
                            .onTapGesture {
                                
                                changeIconName(to: iConName)
                            } .disabled(done)
                    } // :Continue Button
                    .padding(.bottom)
                    .disabled(avatarViewModel.isSomeAvatarSelected())
                    
                    
                }
                .frame(width: geometry.size.width * 0.8)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .navigationBarHidden(true)
            }
        }
    }
}




//struct AvatarSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        AvatarSelectionView(username: $username)
//            .previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
