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
    var LetsMakeItText : String = "Let's make it!"
    var isFinal :Bool = false
    @State private var goToSimilarView: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
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
                HStack{
//                    Spacer().frame(width: geometry.size.width * 0.05)
                Text("Let's make it!")
                    .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.selectionblue)
                    .frame(height: geometry.size.height * 0.1).padding()
                    
                    Spacer().frame(width: geometry.size.width * 0.15, alignment: .topTrailing)
                    NavigationLink {
                        StepsView(username: $username, recipe: recipe)
                    } label: {
                        
                        Circle()
                            .fill(.red).grayscale(0.2)
                            .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1, alignment: .topTrailing)
                            .overlay(  Image(systemName: "xmark").resizable().scaledToFit().scaleEffect(2.5).foregroundColor(.white)
                                        .frame(width: geometry.size.width * 0.02 ,height: geometry.size.height * 0.02 , alignment: .center)
                                       )
            
                    }.padding(.trailing, 10)
                        
                    
//                    .frame(alignment: .center)

                } .frame(width: geometry.size.width,height: geometry.size.height , alignment: .topTrailing)
                
                TimeLineView(currentScene: $currentScene, numberOfScenes: recipe.scenes.count, finalResultNeeded: $finalResultNeeded)
                

                
                
                
                
                VStack{
                  ZStack{
//                        container
                        ForEach(sceneViewModel.getAllScenes(recipeName: recipe.name)) { scene in
                            if finalResultNeeded && scene.finalResult != nil {
                                                            Image(scene.finalResult!)
                                                                .resizable()
                                                                .scaleEffect(0.7)
                                                                .aspectRatio(1.2, contentMode: .fit)
                                                                .frame(width: geometry.size.width  ,height: geometry.size.height * 0.83, alignment: .center)
                                                                .position(x: geometry.size.width * 0.65, y:geometry.size.height * 0.48)
                                                                .padding()
                                                                .zIndex(0)
                                   }
                            
                            // adding ingredients
                            
                            if scene.name.lowercased().contains("add") && currentScene == scene.sceneNumber {
                              
                                DragAndDropView(scene: scene, recipe: recipe, currentScene: $currentScene, isFinal: currentScene == recipe.scenes.count, username: $username)
//                                    .frame(width: geometry.size.width * 0.9 ,height: geometry.size.height * 0.5)
//                                    .offset(x: 0 , y:-geometry.size.height/4)
                                    .zIndex(0)
                                                      
                            }
                            // shaking ingredients
                            
                            if scene.name.lowercased().contains("shake") && currentScene == scene.sceneNumber {
                                ShakingView(currentScene: $currentScene, scene: scene, finalResultNeeded: $finalResultNeeded, isFinal: currentScene == recipe.scenes.count)
                              
                            }
                            
                            // mixing the ingredients and spreading the ingredients
                            if (scene.name.lowercased().contains("mix") || scene.name.lowercased().contains("spread"))  && currentScene == scene.sceneNumber{
                                MixView(username: $username, currentScene: $currentScene, firstImage: scene.container!, secondImage: scene.finalResult!, isFinal: currentScene == recipe.scenes.count)
                            }
                            
                            
                            // leavening
                            if scene.name.lowercased().contains("grow") && currentScene == scene.sceneNumber{
                                JustForTestView(currentScene: $currentScene)
                            }
                            
                            // roll out view
                            if scene.name.lowercased().contains("roll out") && currentScene == scene.sceneNumber{
                                JustForTestView(currentScene: $currentScene)
                            }
                            

                            // crushing ingredients
                            if scene.name.lowercased().contains("crush") && currentScene == scene.sceneNumber {
//                                CrushView(image1: scene.container!, image2: scene.finalResult!, currentScene: $currentScene)
                                RollOutView(image1: scene.container!, image2: scene.finalResult ?? "none", currentScene: $currentScene)
                            }
                            
                        }
                        
                        
                        
                    }
                    
                }
                
                
                
                VStack (spacing:10) {
                    HStack{
                        //                            avatar
                        ZStack{
                        Image (avatarViewModel.getSelectedAvatar().image)
                            .resizable()
                            .scaledToFit()
                            .position(x: geometry.size.width * 0.12, y: geometry.size.height * 0.55) //perfect position for the character
                            .frame( height: geometry.size.height * 0.4, alignment: .bottom)
                        }
                    } //. HSTACK
                    .frame(width: geometry.size.width * 0.8 ,height: geometry.size.height * 0.3, alignment: .bottomTrailing)
                } //close the VSTack
                
              
                  
                   NextStepButton().onTapGesture {
                      self.goToSimilarView.toggle()
                       
                   }.disabled((currentScene <= recipe.scenes.count))
                   
                       .opacity((currentScene <= recipe.scenes.count) ? 0 : 1)
             
               NavigationLink(destination:  AretheysimilarView(username: $username, recipe: recipe), isActive: self.$goToSimilarView) { EmptyView() }
                   
       
               
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
