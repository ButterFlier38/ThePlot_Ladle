//
//  CreateRecipeView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 11/02/22.
//

import SwiftUI

struct CreateRecipeView: View {
    
    @EnvironmentObject var avatarViewModel : AvatarViewModel
    var recipe :Recipe
    var sceneViewModel = SceneViewModel()
    @State var currentScene = 1
    @Binding var username : String
    @State var finalResultNeeded :Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            //            HStack{
            //                The space for the timeline
            //                Rectangle().frame(width: 120, height: 400)
            //               TimelineView(recipe: RecipeViewModel().recipesStore[0]))
            //
            ZStack{
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .overlay(
                        //                            pattern as a background
                        Image("Background-1")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.5)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                    )
                    .foregroundColor(Color(avatarViewModel.getSelectedAvatar().backgroundColor))
                    .ignoresSafeArea()
                    .offset(x: geometry.size.width/8, y: 0)
                
                TimeLineView(currentScene: $currentScene, numberOfScenes: recipe.scenes.count, finalResultNeeded: $finalResultNeeded)
                
//
//                NavigationLink {
//                    StepsView(username: $username, recipe: recipe)
//                } label: {
//                    RoundedRectangle(cornerRadius: 60, style: .continuous)
                
                
               
//                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9 , alignment: .topTrailing)
                
                
                
//
//                Button{
//
//                }label: {
//
//
//                }.position(x: geometry.size.width * 0.89, y: geometry.size.height * 0.5)
                    
//                            Image(systemName: "xmark").resizable().scaleEffect(0.4).foregroundColor(.white))
                      
//////                                       .shadow(color: .white, radius: 1))
                        
//                    Image(systemName: "xmark.").resizable().scaleEffect(0.4).foregroundColor(.white))
                    
//                }
                
                
                
                
                VStack{
                    HStack{
                        Spacer().frame(width: geometry.size.width * 0.25)
                    Text("Let's make it!")
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.selectionblue)
                        .frame(height: geometry.size.height * 0.1, alignment: .top)
                    //                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0)
                    //                        .padding(20)
                    Spacer().frame(width: geometry.size.width * 0.15)
                        NavigationLink {
                            StepsView(username: $username, recipe: recipe)
                        } label: {
                            
                            Circle()
                                .fill(.red).grayscale(0.2)
                                .frame(width: geometry.size.width * 0.08,height: geometry.size.height * 0.08)
                                .overlay(  Image(systemName: "xmark").scaleEffect(2.5).foregroundColor(.white)

                                )
//                                .position(x: geometry.size.width * 0.89, y: geometry.size.height * 0.2)
                                
        //                                       .shadow(color: .white, radius: 1))
                                
                        }
                    }
                    
                    ZStack{
//                        container
                        ForEach(sceneViewModel.getAllScenes(recipeName: recipe.name)) { scene in
                            if finalResultNeeded && scene.finalResult != nil{
                                                            Image(scene.finalResult!)
                                                                .resizable()
                                                                .scaleEffect(0.7)
                                                                .aspectRatio(1.2, contentMode: .fit)
                                                                .frame(width: geometry.size.width  ,height: geometry.size.height * 0.8, alignment: .bottomTrailing)
                                                                .offset(x: geometry.size.width/14, y:geometry.size.height/6)
                                                                .padding()
                                                                .zIndex(0)
                                                        }
                            
                            // adding ingredients
                            
                            if scene.name.lowercased().contains("add") && currentScene == scene.sceneNumber {
                              
                                DragAndDropView(scene: scene, recipe: recipe, currentScene: $currentScene) .frame(width: geometry.size.width  ,height: geometry.size.height * 0.3) .offset(x: 0 , y:-geometry.size.height/4)
                                    .zIndex(1)
                                
//                                Button {
//                                    currentScene += 1
//                                    print(currentScene)
//                                } label: {
//                                    NextStepButtonView()
//                                }.frame(width: geometry.size.width * 0.1,height: geometry.size.height * 0.12, alignment: .bottomTrailing)
//                                        .position(x: geometry.size.width * 0.9 , y: geometry.size.height * 0.8).zIndex(2)
                            
                            }
                            // shaking ingredients
                            
                            if scene.name.lowercased().contains("shake") && currentScene == scene.sceneNumber {
                                ShakingView(currentScene: $currentScene, scene: scene, finalResultNeeded: $finalResultNeeded)
                              
                            }
                            
                            if scene.name.lowercased().contains("mix") {
    
                            }
                            
                            if scene.name.lowercased().contains("spread") {
    
                            }
                            
                            if scene.name.lowercased().contains("grow") {

                            }
                            

                            // crushing ingredientsù
                            if scene.name.lowercased().contains("crush") {
                                CrushView(image: scene.container!, currentScene: $currentScene)
                            }
                            
                        }
                        
                        if currentScene > recipe.recipeSteps.count {
                            
                            NavigationLink {
                                         AretheysimilarView(username: $username, recipe: recipe)
                                     } label: {
                                         NextStepButtonView()
                                     }.frame(width: geometry.size.width * 0.1,height: geometry.size.height * 0.12, alignment: .bottomTrailing)
                            
                           
//                                    .position(x: geometry.size.width * 0.89 , y: geometry.size.height * 0.8)
//                                    .frame(width: geometry.size.width * 0.25,height: geometry.size.height * 0.15, alignment: .bottom)
//                                RoundedRectangle(cornerRadius: 60, style: .continuous)
//                                    .fill(CustomColor.selectiongreen)
////                                    .frame(width: 270, height: 100)
//                                    .frame(width: geometry.size.width * 0.08,height: geometry.size.height * 0.1)
//                                    .overlay(Image(systemName: "arrow.forward").resizable().scaleEffect(0.55).foregroundColor(.white))
//
//
//                                    .onAppear{
//                                        move = 0.9 }
//                                       .shadow(color: .white, radius: 1))
//                                    v.easeInOut(duration : 1).repeatForever()
                            
//                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.9 , alignment: .bottomTrailing)
//                            .Animation(.interpolatingSpring(stiffness: 20, damping: 2))
                                
                            
                            
                            
//                            NavigationLink("Next", destination: AretheysimilarView(username: $username, recipe: recipe))
                        }
                        
                    }
                    
                }
                
                
                
                VStack (spacing:10) {
                    
                    
                    
                    HStack{
                        //                            avatar
                        Image (avatarViewModel.getSelectedAvatar().image)
                            .resizable()
                            .scaledToFit()
                            .position(x: geometry.size.width * 0.23, y: geometry.size.height * 0.5) //perfect position for the character
                            .frame( height: geometry.size.height * 0.4, alignment: .bottom)
                        
                        //                            vignette
                        //                            Image("nuvoletta")
                        //                                .resizable()
                        //                                .scaledToFit()
                        //                                .overlay(Text("Remember the steps? Follow them to get the final result!!").font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.15: geometry.size.height * 0.03)).foregroundColor(CustomColor.selectionblue).padding(10).multilineTextAlignment(.center))
                        //                                .frame( height: geometry.size.height * 0.2, alignment: .bottom)
                        Spacer()
                        
                        
                    } //. HSTACK
                    
                } //close the VSTack
                
            } //close the ZStack
            .navigationBarHidden(true)
        } //close geometry bracket
        .edgesIgnoringSafeArea([.top,.bottom])
    }
    
} //close view

//struct CreateRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateRecipeView().previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
