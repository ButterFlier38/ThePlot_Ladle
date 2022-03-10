//
//  BakeView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 09/03/22.
//

import SwiftUI

struct BakeView: View {
    @Binding var currentScene :Int
    var scene :RecipeScene
    var sceneViewModel :SceneViewModel = SceneViewModel()
    @Binding var finalResultNeeded :Bool
    var isFinal :Bool
    @Binding var username : String
    var recipe :Recipe
    
    var NuvolettaBakeText : String = "Place the pizza in the oven!"
    
    @State var dragAmount = CGSize.zero
    @State var pos = CGPoint(x: 10, y: 20)
    @State var isDragged : Bool = false
    @State private var scale: CGFloat = 0
    @State private var scal2: CGFloat = 0

    @State private var indx : Double = 0
    @State private var opac: CGFloat = 1
    
    @State private var goToSimilarView: Bool = false
    
    
    
    var body: some View {
        GeometryReader { geometry in
        ZStack{
            Image(scene.finalResult!)
                .resizable()
                .scaleEffect(scale)
                .aspectRatio(1.2, contentMode: .fit)
                .frame(width: geometry.size.width  ,height: geometry.size.height * 0.8, alignment: .bottomTrailing)
                .offset(x: geometry.size.width/14, y:geometry.size.height/6)
                .zIndex(indx)
                .animation(.linear(duration: 1).delay(2.5), value: scale)


                Image(scene.container!)
                    .resizable()
//                    .scaleEffect(0.7)
                    .scaleEffect(isDragged ? 0.3 : 0.5)
                    .aspectRatio(1.2, contentMode: .fit)
                    .frame(width: geometry.size.width  ,height: geometry.size.height * 0.8, alignment: .bottomTrailing)
                    .offset(x: geometry.size.width/14, y:geometry.size.height/8)
                    .zIndex(isDragged ? (indx - 2) : (indx + 1))
                    .offset(dragAmount)
                    .opacity(opac)
                    .animation(.linear(duration: 1).delay(2), value: opac)
                    .gesture(

                DragGesture(coordinateSpace: .global)
                    .onChanged{
                         if !isDragged {
                                self.pos = CGPoint(x: $0.location.x, y: $0.location.y)
                                self.dragAmount = CGSize(width : $0.translation.width, height: $0.translation.height)
                                print("\(pos.x)")
                                print("\(pos.y)")
                            }
                    }
                    .onEnded { _ in
                        if (pos.x > (UIScreen.main.bounds.width/2)/1.5 && (pos.x < (UIScreen.main.bounds.width - UIScreen.main.bounds.width/6)/1.5) && (pos.y > (UIScreen.main.bounds.height/2)/1.3) && (pos.y < (UIScreen.main.bounds.height - UIScreen.main.bounds.height/3)/1.3)){

                                 print("\(pos.x)")
                            print("\(pos.y)")

                            if !isDragged {
                            isDragged = true
                            scale = 0.7
                            opac = 0.0
                                scal2 = 1.0
                                indx = 2
                                SoundManager.instance.playSound("OvenSound.ogg" , spd: 2.5, vol: 0.5)

                            }
//
                        } else {
                            self.dragAmount = .zero
                            isDragged = false
                        }
                   }
            )

            RoundedRectangle(cornerRadius: 60, style: .continuous)
                .fill(CustomColor.selectionblue)
                .frame(width: geometry.size.width * 0.45  ,height: geometry.size.height * 0.4, alignment: .bottomTrailing)
                .position(x: geometry.size.width * 0.4, y:geometry.size.height * 0.45).opacity(0.3).zIndex(0)

            Image("oven").resizable().scaledToFit()
                .frame(width: geometry.size.width * 0.4  ,height: geometry.size.height * 0.4, alignment: .bottomTrailing)
                .position(x: geometry.size.width * 0.55, y:geometry.size.height * 0.45).zIndex(0)
//
            Image("nuvoletta")
                .resizable()
//                            .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .overlay(
                   Text(LocalizedStringKey(String(NuvolettaBakeText)))
                                   .scaledToFit()
                                   .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.025))
                                   .multilineTextAlignment(.center).padding().foregroundColor(CustomColor.selectionblue)
                              
                    )

                .frame(width: geometry.size.width * 0.35 ,height: geometry.size.height * 0.1, alignment: .bottom)
                .position(x: geometry.size.width * 0.45 ,y: geometry.size.height * 0.8)
//
            NextStepButton().onTapGesture {
                if !isFinal {
                currentScene += 1
                }
                else if isFinal && scale >= 0.7 {
                    self.goToSimilarView.toggle()
                }
            }.scaleEffect(scal2)
            .disabled(scale == 0)
                .opacity((scale != 0) ? 1 : 0).zIndex(3)
                .animation(.linear(duration: 1).delay(2.5), value: scal2)
           NavigationLink(destination:  AretheysimilarView(username: $username, recipe: recipe), isActive: self.$goToSimilarView) { EmptyView() }
             }
        }.onAppear {
            SoundManager.instance.playSound("NextStepSound.mp3" , spd: 1, vol: 0.5)
        }
        }
    }


//struct BakeView_Previews: PreviewProvider {
//    static var previews: some View {
//        BakeView()
//    }
//}
