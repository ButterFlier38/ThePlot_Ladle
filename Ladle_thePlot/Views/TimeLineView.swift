//
//  TimeLineView.swift
//  Ladle_thePlot
//
//  Created by Rosa Cimmino on 22/02/22.
//

import SwiftUI

struct TimeLineView: View {
    
    @Binding var currentScene :Int
    var numberOfScenes : Int // the numebr of schene it has to come from the viewmodel recipe.scenes.count
   
    @EnvironmentObject var avatarViewModel : AvatarViewModel
    @Binding var finalResultNeeded :Bool
    
@State private var currentIndex = 0
    
    
    var StartText : String = "Start"
    var body: some View{
        //       timeline view
        ZStack {
            GeometryReader { geometry in
                ScrollView{
                    VStack(alignment:.leading, spacing: 10){
                        
                        Text(LocalizedStringKey(String(StartText)))
                            .font(Font.custom("HappyMonkey-Regular", size: 40))
                            .minimumScaleFactor(0.0001)
                            .lineLimit(1)
                            .foregroundColor(CustomColor.selectionblue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 15)
                        
                        
                        
                        ForEach(1..<numberOfScenes+1) { index in
                                Path { path in
                                    path.move(to: CGPoint(x: geometry.size.width / 20, y: 0))
                                    path.addLine(to: CGPoint(x: geometry.size.width / 20, y: geometry.size.width/2))
                                }
                                .stroke(style: StrokeStyle( lineWidth: 12))
                                .foregroundColor(CustomColor.selectionblue)
                              
                                
                            // for the current scene
                            if (index == currentScene){
                                
                                
                                Circle()
                                    .strokeBorder(CustomColor.selectionblue,lineWidth: 4)
                                    .background(
                                        ZStack{
                                            Circle()
                                                .foregroundColor(Color.white)
                                            Image(avatarViewModel.getSelectedAvatar().headImage)
                                                .resizable()
                                                .scaleEffect(0.7)
                                        }
                                    )
                                    .frame(width: 80, height: 80)
                             
                                    .position(x: geometry.size.width/20, y: 0)
                                    .frame(height: geometry.size.height/4.5)
                          
                              // for the previous steps
                            } else if (index < currentScene) {
                            
                                Circle()
                                    .strokeBorder(CustomColor.selectionblue,lineWidth: 4)
                                    .background(
                                        ZStack{
                                            Circle()
                                                .foregroundColor(Color.white)
                                        Circle().foregroundColor(CustomColor.selectiongreen)
                                                    .frame(width: 47, height: 47, alignment: .center)
                                                    .overlay(Text("\(index)")
                                                                .font(Font.custom("HappyMonkey-Regular", size: 30))
                                                                .fontWeight(.bold)
                                                                .foregroundColor(Color.white)
                                                    )
                                        }
                                    )
                                    .frame(width: 80, height: 80)
                             
                                    .position(x: geometry.size.width/20, y: 0)
                                    .frame(height: geometry.size.height/4.5)
                                    .onTapGesture {
                                        currentScene = index
                                        
                                        if finalResultNeeded {
                                        finalResultNeeded.toggle()
                                        }
                                    }
         
                            // for the steps after the current one
                            } else if  (index > currentScene){
                                
                                Circle()
                                    .fill(CustomColor.selectionblue)
                                    .frame(width: 70, height: 70)
                                    .overlay(Text("\(index)")
                                                .font(Font.custom("HappyMonkey-Regular", size: 38))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.white)
                                             
                                    )
                                    .position(x: geometry.size.width/20, y: 0)
                                    .frame(height: geometry.size.height/4.5)
                            } //: else if statemnet
                        } //:foreach
                        
                    } //:Vstack
                    .frame( alignment: .leading)
                    .padding(5)

                    
                } //:scrollview
                .frame(width: geometry.size.width * 0.1, alignment: .leading)
             
            } //close geometry
//            .frame( width:UIScreen.main.bounds.width, alignment: .leading)
           
        } //zstack
        
    } //: body
} //: view



//struct TimeLineView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeLineView()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}

