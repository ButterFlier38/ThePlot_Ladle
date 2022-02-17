
//
//  IngredientsView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 11/02/22.
//

import SwiftUI

struct IngredientsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        GeometryReader { geometry in
        ZStack{
            ZStack{
            Circle().foregroundColor(CustomColor.bggreen).scaleEffect(0.57).position(x: 650, y: 170)
            Circle().foregroundColor(CustomColor.bgblue).scaleEffect(0.45).position(x: 370, y: 80)
            Circle().foregroundColor(CustomColor.bgpink).scaleEffect(0.35).position(x: 1100, y: 60)
            Circle().foregroundColor(CustomColor.bgyellow).scaleEffect(0.45).position(x: 900, y: 100)
            }.frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9,alignment: .topTrailing)
            
            Ellipse().foregroundColor(CustomColor.bggreen)
                .scaleEffect(1.2).position(x: 570, y: 950)
                       
            VStack{
            Spacer()
                            
            HStack(alignment: .center, spacing: 80){
                
                VStack(alignment: .center, spacing: 9){
                ZStack{
                    Circle()
                        .scaleEffect(1.1)
                        .foregroundColor(.white)
                        .overlay(Image("latte").scaleEffect(0.02))
                      
                        
                }
                    Text("100 ml of Condensed Milk")
                        .font(Font.custom("HappyMonkey-Regular", size:30 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue)  .frame(maxWidth: .infinity, alignment: .center) .padding(.leading)
                    
                }
                
                
                
            VStack (spacing: 9){
                    ZStack{
                Circle()
                            .scaleEffect(1.1)
                    .foregroundColor(.white)
                    .overlay(Image("latte").scaleEffect(0.02))
                    }
                    Text("50 gr of Ice Cubes")
                    .font(Font.custom("HappyMonkey-Regular", size: 30 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue)  .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading)
                        
                    
            }
                
                VStack (spacing: 9){
                        ZStack{
                    Circle()
                                .scaleEffect(1.1)
                        .foregroundColor(.white)
                        .overlay(Image("strawberries").scaleEffect(0.02))
                        }
                        Text("50 gr of Strawberry")
                        .font(Font.custom("HappyMonkey-Regular", size: 30 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue)  .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.leading)
                    
                }
        
//                sbdnkcnakvnaj
                
                VStack (spacing: 9){
                        ZStack{
                    Circle()
                        .scaleEffect(1.1)
                        .foregroundColor(.white)
                        .overlay(Image("banana").scaleEffect(0.02))
                        }
                        Text("50 gr of Banana")
                        .font(Font.custom("HappyMonkey-Regular", size: 30 )).fontWeight(.bold).foregroundColor(CustomColor.selectionblue)  .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.leading)
                    
                }
                
  
            } .frame(height: geometry.size.height * 0.4,  alignment: .topLeading)
//        close Hstack
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
//                nsdvnsjdvjsdfnvjn

            } //close vstack
            .frame(height: geometry.size.height, alignment: .center)
            
            Image ("character_giorgia")
                    .resizable()
                    .scaleEffect(0.5)
                    .aspectRatio(0.7, contentMode: .fit)
                    .position(x: 170, y: 650)
            
            
            NavigationLink {
              StepsView()
            } label: {
                RoundedRectangle(cornerRadius: 60, style: .continuous)
                    .fill(CustomColor.selectionblue)
                    .frame(width: 270, height: 100)
                    .overlay(
                        Text("Continue").font(Font.custom("HappyMonkey-Regular", size: 37 )).foregroundColor(.white).shadow(color: .white, radius: 1))
                   
            }
            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9, alignment: .bottomTrailing)
//
            
        } //close zstack
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItem(placement:.principal){
                Text("Ingredients")
                    .font(Font.custom("HappyMonkey-Regular", size: 80))
                    .foregroundColor(CustomColor.selectionblue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .shadow(color: CustomColor.selectionblue, radius: 10)
            }
        } .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9, alignment: .topLeading)

               .edgesIgnoringSafeArea(.bottom)
               .navigationBarBackButtonHidden(true)
               .navigationBarItems(leading:
                   Button(action: {
                       self.presentationMode.wrappedValue.dismiss()
                   }) {
                       ZStack{
                                 Circle().foregroundColor(CustomColor.selectionblue).frame(width: 100, height: 100)
                                         Image(systemName: "arrowshape.turn.up.backward.fill").scaleEffect(2.5).foregroundColor(.white)}
                                     })
        } //close geometry reader
        }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView().previewDevice("iPad Pro (11-inch) (3rd generation)")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
