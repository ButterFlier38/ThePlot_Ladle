////
////  Step0.swift
////  Ladle_thePlot
////
////  Created by Irene Fernando on 17/02/22.
////
//
//
//import SwiftUI
//
//struct Step0: View {
//    @State var dragAmount = CGSize.zero
//    @State var isDragged : Bool = false
//
//    var recipe :Recipe
//    @Binding var username :String
//    var body: some View {
//
//        GeometryReader { geometry in
//            HStack{
////                The space for the timeline
////                Rectangle().frame(width: 120, height: 400)
////               TimelineView(recipe: RecipeViewModel().recipesStore[0]))
////
//        ZStack{
//            RoundedRectangle(cornerRadius: 100, style: .continuous)
//                .foregroundColor(CustomColor.bggreen)
//                .ignoresSafeArea()
//                .offset(x: geometry.size.width/9, y: 0)
//
////            i put geometry.size.width/8 as the width of the space dedicated to the timeline in the screenso that all the other measures take this dimesnion into account
//
//
//            NavigationLink {
//                StepsView(username: $username, recipe: recipe)
//            }label: {
//                Circle()
//    //                        .resizable()
//                    .scaleEffect(0.1)
//                    .foregroundColor(.red)
//                    .overlay(Text("X")
//                                .font(Font.custom("HappyMonkey-Regular", size: 40)).foregroundColor(.white))
//            }
//             .position(x: 1200, y: 700)
//
//            ZStack{
//                Path { path in
//                    path.move(to: CGPoint(x: geometry.size.width/10, y: geometry.size.height/11))
//                    path.addLine(to: CGPoint(x: geometry.size.width/10, y: geometry.size.height - 50))
////                    path.move(to: CGPoint(x: 0, y: 0))
////                    path.addLine(to: CGPoint(x:0, y: 0))
//                }
//                .stroke(CustomColor.selectionblue, style: StrokeStyle(lineWidth: 10, dash: [20]))
//        VStack{
//            Text("Start")
//                .font(Font.custom("HappyMonkey-Regular", size: 40))
//                .foregroundColor(CustomColor.selectionblue)
////                .shadow(color: CustomColor.selectionblue, radius: 3, x: 2, y: 2)
//                .position(x: geometry.size.width/18, y: geometry.size.height/10 - 10)
//
//            VStack(alignment: .center, spacing: 30){
//
//
////                    Circle().stroke(CustomColor.selectionblue, lineWidth: 2).scaleEffect(1.2).foregroundColor(.white)
////                        .overlay(Image("character_tonia").scaleEffect(0.03))
//                    ZStack{
//                        Circle().stroke(CustomColor.selectionblue, lineWidth: 2).foregroundColor(.white).scaleEffect(1.5)
//                        Image("character_giorgia")
//                            .resizable()
//                            .scaledToFit()
//                            .scaleEffect(1.5)
//                        .clipShape(Circle().scale(0.98) ) }
//
//
//
//                ZStack{
//
//                Circle().foregroundColor(CustomColor.selectionblue)
//
//                        Text("1")
//                        .foregroundColor(.white)
//                        .font(Font.custom("HappyMonkey-Regular", size: 30))
//                }
//
//                    ZStack{
//
//                    Circle().foregroundColor(CustomColor.selectionblue)
//
//                            Text("2")
//                            .foregroundColor(.white)
//                            .font(Font.custom("HappyMonkey-Regular", size: 30))
//                    }
//                    ZStack{
//
//                    Circle().foregroundColor(CustomColor.selectionblue)
//
//                            Text("3")
//                            .foregroundColor(.white)
//                            .font(Font.custom("HappyMonkey-Regular", size: 30))
//                        }
//                    ZStack{
//
//                    Circle().foregroundColor(CustomColor.selectionblue)
//
//                            Text("4")
//                            .foregroundColor(.white)
//                            .font(Font.custom("HappyMonkey-Regular", size: 30))
//                        }
//            }.frame(width: 90, height: 800, alignment: .leading)
//                .navigationViewStyle(.columns)
//                .navigationBarBackButtonHidden(true)
//                .navigationBarHidden(true)
//
//
////                Text("\(recipe.noofsteps)").foregroundColor(.black)
//
//
//        }.frame(width: 110, height: 950, alignment: .leading)
////        .frame(width: 110, height: 950, alignment: .leading)
//            }
////            .frame(width: 100, height: 900, alignment: .center)
//
//        .position(x: geometry.size.width/20, y: geometry.size.width/3)
//
//            Image("blender")
//                    .resizable()
//                    .scaleEffect(0.5)
//                    .aspectRatio(1.2, contentMode: .fit)
//                    .position(x: geometry.size.width - geometry.size.width/4, y: geometry.size.height - geometry.size.height/4)
//
//
//
//            VStack (spacing:2) {
//
//                Text("Let's make it!")
//                    .font(Font.custom("HappyMonkey-Regular", size: 80))
//                    .foregroundColor(CustomColor.selectionblue)
//
//
//
//                HStack(spacing:8){
//
////                    ingredients to drag and drop
//
//                    Group{
////                        NavigationLink(destination: Step1()){
//                        ZStack{
//                        Circle()
//                            Image("latte")
//                                .resizable()
//                                .scaledToFit()
//                                .scaleEffect(isDragged ? 0.4 : 0.8)
//                                .offset(dragAmount)
//                                .zIndex(dragAmount == .zero ? 1 : 0)
////                            work on this one to drag on top of things
////                            works only on the current zstack
//
//
//                   .gesture(DragGesture(coordinateSpace: .global)
//                                .onChanged{ self.dragAmount = CGSize(width : $0.translation.width, height: $0.translation.height)
//                    }
//                                .onEnded { _ in
//
//                        if abs(dragAmount.width) > geometry.size.width/3 {
////                            NavigationLink(destination: Step1()){
//                            isDragged = true
////                            _navigationDestination(item:  Step1())
//
////                            }
////                                        remove the ingredient
//                        } else {
//                            self.dragAmount = .zero
//                            isDragged = false
//                        }
//
//                    }
//                    )
//                        }
//
////                    }
//                        ZStack{
//                        Circle()
//                            Image("character_tonia")
//                                .resizable()
//                                .scaledToFit()
//                                .scaleEffect(0.8)
//                        }
//
//                        ZStack{
//                        Circle()
//                            Image("strawberries")
//                                .resizable()
//                                .scaledToFit()
//                                .scaleEffect(0.8)
//                        }
//
//                        ZStack{
//                        Circle()
//                            Image("banana")
//                                .resizable()
//                                .scaledToFit()
//                                .scaleEffect(0.8)
//                        }
//
//
//
//                    .foregroundColor(.white)
//
//                } //close Hstack
//                .frame(width: geometry.size.width - geometry.size.width/8, height: geometry.size.height/3, alignment: .trailing)
//                .offset(x: geometry.size.width/15 , y:0)
//
////                avatar
//
//
//                HStack{
//                Image ("character_giorgia")
//                        .resizable()
//                        .scaleEffect(0.8)
//                        .aspectRatio(0.7, contentMode: .fit)
////                        .position(x: 250, y: 650)
//                        .position(x: geometry.size.width/6.5, y: geometry.size.height/2.6)
//                        .overlay( Image("nuvoletta").scaleEffect(0.16).position(x: 510, y: 250))
//                                    .overlay(Text("Start adding the ingredients to the blender, following the steps of the recipe.")
//                                                .font(Font.custom("HappyMonkey-Regular", size: 20)).frame(width: 270, height: 100, alignment: .leading).position(x: 520, y: 250))
//
//
////                    blender
//                    Circle()
////                        .resizable()
//                        .scaleEffect(1.2)
////                        .aspectRatio(0.7, contentMode: .fit)
////                        .position(x: 250, y: 650)
//                        .position(x: geometry.size.width/4.3, y: geometry.size.height/3)
//
//
//                }
//
//                }
//
//            } //close the VSTack
//
//        } //close the ZStack
//        } //close geometry bracket
//    }
//    }
//    }
//
//
//
////struct Step0_Previews: PreviewProvider {
////    static var previews: some View {
////        Step0()
////.previewInterfaceOrientation(.portrait)
////    }
////}
