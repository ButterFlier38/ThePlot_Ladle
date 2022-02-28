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
                
                TimeLineView(currentScene: $currentScene, numberOfScenes: recipe.scenes.count)
                
                
                
                VStack{
                    Text("Let's make it!")
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.selectionblue)
                        .frame(width: geometry.size.width ,height: geometry.size.height * 0.1, alignment: .top)
                    //                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0)
                    //                        .padding(20)
                    
                    
                    ZStack{
                        ForEach(sceneViewModel.getAllScenes(recipeName: recipe.name)) { scene in
                            if sceneViewModel.isEnvironmentNeeded(scene: scene) {
                                Image(scene.container!)
                                    .resizable()
                                    .scaleEffect(0.7)
                                    .aspectRatio(1.2, contentMode: .fit)
                                    .frame(width: geometry.size.width  ,height: geometry.size.height * 0.8, alignment: .bottomTrailing)
                                    .offset(x: 0 , y:geometry.size.height/6)
                                    .padding()
                                    .zIndex(0)
                                    
                                //                                .position(x: geometry.size.width - geometry.size.width/4, y: geometry.size.height - geometry.size.height/4)
                            }
                            
                            
                            
                            if scene.name.lowercased().contains("add") && currentScene == scene.sceneNumber {
                                
                                DragAndDropView(scene: scene, recipe: recipe, currentScene: $currentScene) .frame(width: geometry.size.width  ,height: geometry.size.height * 0.3) .offset(x: 0 , y:-geometry.size.height/4)
                                    .zIndex(1)
                            }
                            
                            
                            // adding ingredients
                            
                            
                            
                            // shaking ingredients
                            
                            if scene.name.lowercased().contains("shake") && currentScene == scene.sceneNumber {
                                
                                CrushView(image: scene.container!, currentScene: $currentScene)
                                //                            Image(scene.container!)
                                
                                //                                .resizable()
                                
                                //                                .scaleEffect(0.5)
                                
                                //                                .aspectRatio(1.2, contentMode: .fit)
                                
                                //                                .position(x: geometry.size.width - geometry.size.width/4, y: geometry.size.height - geometry.size.height/4)
                                
                                ////                                .onShake(print("DeviceShaken"))
                                
                                
                                
                            }
                            
                            
                            
                            if scene.name.lowercased().contains("mix") {
                                
                                
                                
                            }
                            
                            if scene.name.lowercased().contains("spread") {
                                
                                
                                
                            }
                            
                            if scene.name.lowercased().contains("grow") {
                                
                                
                                
                            }
                            
                            
                            
                            // crushing ingredients
                            
                            if scene.name.lowercased().contains("crush") {
                                
                                //CrushView(image: scene.container!)
                                
                                
                                
                            }
                            
                        }
                        
                        if currentScene > recipe.recipeSteps.count {
                            NavigationLink("Next", destination: AretheysimilarView())
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
    }
    
} //close view

//struct CreateRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateRecipeView().previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
