//
//  Steps4.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 18/02/22.
//




import SwiftUI

struct Step4: View {
    @State var dragAmount = CGSize.zero
//    var recipe :Recipe
    @Binding var username: String
    var body: some View {
        
        GeometryReader { geometry in
            HStack{
//                The space for the timeline
//                Rectangle().frame(width: 120, height: 400)
//               TimelineView(recipe: RecipeViewModel().recipesStore[0]))
//
        ZStack{
            RoundedRectangle(cornerRadius: 100, style: .continuous)
                .foregroundColor(CustomColor.bggreen)
                .ignoresSafeArea()
                .offset(x: geometry.size.width/9, y: 0)
            
//            i put geometry.size.width/8 as the width of the space dedicated to the timeline in the screenso that all the other measures take this dimesnion into account
         
            
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: geometry.size.width/10, y: geometry.size.height/11))
                    path.addLine(to: CGPoint(x: geometry.size.width/10, y: geometry.size.height - 50))
//                    path.move(to: CGPoint(x: 0, y: 0))
//                    path.addLine(to: CGPoint(x:0, y: 0))
                }
                .stroke(CustomColor.selectionblue, style: StrokeStyle(lineWidth: 10, dash: [20]))
        VStack{
            Text("Start")
                .font(Font.custom("HappyMonkey-Regular", size: 40))
                .foregroundColor(CustomColor.selectionblue)
//                .shadow(color: CustomColor.selectionblue, radius: 3, x: 2, y: 2)
                .position(x: geometry.size.width/18, y: geometry.size.height/10 - 10)
            
            VStack(alignment: .center, spacing: 30){
                
                    NavigationLink(destination: Step0(username: $username)){
                ZStack{
                    
                Circle().foregroundColor(CustomColor.selectiongreen)
                   
                        Text("0")
                        .foregroundColor(.white)
                        .font(Font.custom("HappyMonkey-Regular", size: 30))
                }}
               
                NavigationLink(destination: Step1(username: $username)){
                    ZStack{
                        
                    Circle().foregroundColor(CustomColor.selectiongreen)
                       
                            Text("1")
                            .foregroundColor(.white)
                            .font(Font.custom("HappyMonkey-Regular", size: 30))
                    }}
                NavigationLink(destination: Step2(username: $username)){
                    ZStack{
                        
                    Circle().foregroundColor(CustomColor.selectiongreen)
                       
                            Text("2")
                            .foregroundColor(.white)
                            .font(Font.custom("HappyMonkey-Regular", size: 30))
                    }}
                NavigationLink(destination: Step3(username: $username)){
                ZStack{
                    
                Circle().foregroundColor(CustomColor.selectiongreen)
                   
                        Text("4")
                        .foregroundColor(.white)
                        .font(Font.custom("HappyMonkey-Regular", size: 30))
                }}
                   
                ZStack{
                    Circle().stroke(CustomColor.selectionblue, lineWidth: 2).foregroundColor(.white).scaleEffect(1.5)
                    Image("character_giorgia")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1.5)
                    .clipShape(Circle().scale(0.98) ) }
                   
            }
                .frame(width: 90, height: 800, alignment: .leading)
                .navigationViewStyle(.columns)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                
                
//                Text("\(recipe.noofsteps)").foregroundColor(.black)
            
        
        }.frame(width: 110, height: 950, alignment: .leading)
//        .frame(width: 110, height: 950, alignment: .leading)
            }
//            .frame(width: 100, height: 900, alignment: .center)
      
        .position(x: geometry.size.width/20, y: geometry.size.width/3)
                
         
            
            VStack (spacing:2) {
                
                Text("Let's make it!")
                    .font(Font.custom("HappyMonkey-Regular", size: 80))
                    .foregroundColor(CustomColor.selectionblue)
                
                HStack(spacing:8){
                    
//                    ingredients to drag and drop

                    Group{
                       
                        
                        NavigationLink(destination: Step4(username: $username)){
                        
                        ZStack{
                            Circle().foregroundColor(CustomColor.bggreen).scaleEffect(0.01)
                            
                               
                        }
                        }
                    
                    }
                    .foregroundColor(.white)
                    
                } //close Hstack
                .frame(width: geometry.size.width - geometry.size.width/8, height: geometry.size.height/3.2, alignment: .trailing)
                .offset(x: geometry.size.width/15 , y:0)
                
//                avatar
                
                
                HStack{
                Image ("character_giorgia")
                        .resizable()
                        .scaleEffect(0.8)
                        .aspectRatio(0.7, contentMode: .fit)
             .position(x: geometry.size.width/6.5, y: geometry.size.height/2.6)
             .overlay( Image("nuvoletta").scaleEffect(0.18).position(x: 550, y: 500))
                                    .overlay(Text("Shake your iPad to blend the ingredients!")
                                                .font(Font.custom("HappyMonkey-Regular", size: 20)).frame(width: 500, height: 100, alignment: .leading).position(x: 650, y: 500))
                   
                    
//                    blender
                    Circle()
//                        .resizable()
                        .scaleEffect(1.2)
//                        .aspectRatio(0.7, contentMode: .fit)
//                        .position(x: 250, y: 650)
                        .position(x: geometry.size.width/6, y: geometry.size.height/8)
                    
                    
                }
                
            } //close the VSTack
            
            
//            NavigationLink(destination: StepsView()){
//            Circle()
////                        .resizable()
//                .scaleEffect(0.06)
//                .foregroundColor(.red)
//                .overlay(Text("X")
//                            .font(Font.custom("HappyMonkey-Regular", size: 40)).foregroundColor(.white))
//                .position(x: geometry.size.width/1.06, y: geometry.size.height/14)
//
//            }
            
            
            
        } //close the ZStack
        } //close geometry bracket
    }
    }
    }


//struct Step4_Previews: PreviewProvider {
//    static var previews: some View {
//        Step4()
//    }
//}
