//
//  AretheysimilarView.swift
//  Ladle_thePlot
//
//  Created by Rosa Cimmino on 17/02/22.
//

import SwiftUI
import UIKit


struct AretheysimilarView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    @EnvironmentObject var avatarViewModel : AvatarViewModel
    @Binding var username : String
    var recipe :Recipe
    var buttonText : String = "Done"
    var takephotobuttonText : String = "Take a photo"
    var AreTheySimilarText : String = "Are they similar?"
//    @StateObject private var model = ContentViewModel()
    var body: some View {
        
        GeometryReader { geometry in

            ZStack {
//                background
                RoundedRectangle(cornerRadius: 210, style: .continuous)
                    .overlay(
                        //                            pattern as a background
                        Image("Background-1")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.5)
                            .clipShape(RoundedRectangle(cornerRadius: 210))
                    )
                    .foregroundColor(Color(avatarViewModel.getSelectedAvatar().backgroundColor))
                    .ignoresSafeArea()
                
//                animation
                AnimationView()
                    .offset(x : 0, y : -500 )
                    .zIndex(0)
                
                
//                button here so it's placed always in the same place
                
                HStack{
                    Button() {
                        self.showImagePicker = true
                    }label: {
                        RoundedRectangle(cornerRadius: 60, style: .continuous)
                            .fill(CustomColor.selectionblue)
                            .frame(width: 270, height: 100)
                           .overlay(
                                Text(LocalizedStringKey(String(takephotobuttonText))).font(Font.custom("HappyMonkey-Regular", size: 37 )).foregroundColor(.white).shadow(color: .white, radius: 1))
                            
                    }
                    
                NavigationLink {
                    ChooseTheRecipeView(username: $username)
                } label: {
                    RoundedRectangle(cornerRadius: 60, style: .continuous)
                        .fill(CustomColor.selectionblue)
                        .frame(width: 270, height: 100)
                       .overlay(
                            Text(LocalizedStringKey(String(buttonText))).font(Font.custom("HappyMonkey-Regular", size: 37 )).foregroundColor(.white).shadow(color: .white, radius: 1))
                        
                }
                    
                }.position(x: geometry.size.width * 0.75, y:geometry.size.height * 0.9)
               
                Image(avatarViewModel.getSelectedAvatar().image)
                    .resizable()
                    .scaledToFit()
                    .position(x: geometry.size.width * 0.2, y: geometry.size.height * 0.56)
                   .frame( height: geometry.size.height * 0.5, alignment: .bottomLeading)
                    
               
                
                VStack{ //no timeline
                    
                    Text(LocalizedStringKey(String(AreTheySimilarText)))
                       .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.selectionblue)
                        .frame(maxWidth: .infinity, alignment: .center)
//                        .shadow(color: CustomColor.selectionblue, radius: 3)
                   
                    HStack (alignment: .center, spacing: 100) {
                    
                        Image(recipe.image)
                            .resizable()
                            .aspectRatio(0.9, contentMode: .fit)
                        
                        ZStack{
                        Circle().fill(CustomColor.selectionblue).grayscale(0.2)
                                .aspectRatio(0.9, contentMode: .fit)
                                .overlay(Image(systemName: "camera.fill").resizable().scaledToFit().padding(40)
                                        .grayscale(1)
                                        .opacity(0.3))
                        
                        image?.resizable()
                                .clipShape(Circle())
//                                .aspectRatio(0.9, contentMode: .fit)
                                .frame( height: geometry.size.height * 0.5, alignment: .center)
                        }
                   
                    } .padding(30)
                        .frame(width: geometry.size.width/1.4,height: geometry.size.height/2)
                    Spacer()
                    Spacer()
                } //Close vstack
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
            }  //close the zstack
            .navigationBarHidden(true)
            .sheet(isPresented: self.$showImagePicker) {
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            }
        } //close geometry
        
    }
}

//struct AretheysimilarView_Previews: PreviewProvider {
//    static var previews: some View {
//        AretheysimilarView().previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
