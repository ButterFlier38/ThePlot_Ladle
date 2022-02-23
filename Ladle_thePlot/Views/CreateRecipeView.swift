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
    
    var body: some View {
        
        GeometryReader { geometry in
//            HStack{
                //                The space for the timeline
                //                Rectangle().frame(width: 120, height: 400)
                //               TimelineView(recipe: RecipeViewModel().recipesStore[0]))
                //
                ZStack{
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                        .foregroundColor(Color(avatarViewModel.getSelectedAvatar().backgroundColor))
                        .ignoresSafeArea()
                        .offset(x: geometry.size.width/8, y: 0)
                    
                    TimeLineView()
                       
                    
                    VStack{
                    
                    Text("Let's make it!")
                        .font(Font.custom("HappyMonkey-Regular", size:  geometry.size.height > geometry.size.width ? geometry.size.width * 0.2: geometry.size.height * 0.1))
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.selectionblue)
                        .frame(maxWidth: .infinity, alignment: .top)
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0)
                        .padding(20)
    
                   
                    
                    ForEach(sceneViewModel.getAllScenes(recipeName: recipe.name)) { scene in
                        
                        if sceneViewModel.isEnvironmentNeeded(scene: scene) {
                            Image(scene.container!)
                                .resizable()
                                .scaleEffect(0.5)
                                .aspectRatio(1.2, contentMode: .fit)
                                .position(x: geometry.size.width - geometry.size.width/4, y: geometry.size.height - geometry.size.height/4)
                        }
                        
                        // adding ingredients
                        
                        if scene.name.lowercased().contains("add") {
                            
                            DragAndDropView(scene: scene, recipe: recipe)
                            
                        }
                        
                        // shaking ingredients
                        
                        if scene.name.lowercased().contains("shake") {
                            
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
    
    
    // all the actions that could be done in a scene
    func action(scene :RecipeScene, recipe :Recipe) {

        if scene.name.lowercased().contains("shake") {
            
        }
        if scene.name.lowercased().contains("mix") {
            
        }
        if scene.name.lowercased().contains("spread") {
            
        }
        if scene.name.lowercased().contains("grow") {
            
        }
        if scene.name.lowercased().contains("crush") {
            
        }
    }
    
} //close view

//struct CreateRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateRecipeView().previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
