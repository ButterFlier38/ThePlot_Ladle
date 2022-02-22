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
            HStack{
                //                The space for the timeline
                //                Rectangle().frame(width: 120, height: 400)
                //               TimelineView(recipe: RecipeViewModel().recipesStore[0]))
                //
                ZStack{
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                        .foregroundColor(Color(avatarViewModel.getSelectedAvatar().backgroundColor))
                        .ignoresSafeArea()
                        .offset(x: geometry.size.width/8, y: 0)
                    
                    
                    ForEach(sceneViewModel.getAllScenes(recipeName: recipe.name)) { scene in
                        
                        if sceneViewModel.isEnvironmentNeeded(scene: scene) {
                            Image(scene.container!)
                                .resizable()
                                .scaleEffect(0.5)
                                .aspectRatio(1.2, contentMode: .fit)
                                .position(x: geometry.size.width - geometry.size.width/4, y: geometry.size.height - geometry.size.height/4)
                        }
                        
                        if scene.name.lowercased().contains("add") {
                             DragAndDropView(scene: scene, recipe: recipe)
                        }
                        
  
                    }
                    
                    
                    
                    
                    VStack (spacing:2) {
                        
                        Text("Let's make it!")
                            .font(Font.custom("HappyMonkey-Regular", size: 80))
                            .foregroundColor(CustomColor.selectionblue)
                        
                        
                        
                        //                avatar
                        
                        
                        HStack{
                            Image (avatarViewModel.getSelectedAvatar().image)
                            //                    if the character avatar is tonia we should put a scale affetc = 0.9 or 1 because she is stretched with 0.8 (maybe create a variable with a ternary operator that manages the scale effect)
                                .resizable()
                                .scaleEffect(0.8)
                                .aspectRatio(0.7, contentMode: .fit)
                            //                        .position(x: 250, y: 650)
                                .position(x: geometry.size.width/4.3, y: geometry.size.height/2.6)
                            
                        }
                        
                    } //close the VSTack
                    
                } //close the ZStack
            } //close geometry bracket
        }
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
    
}

//struct CreateRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateRecipeView().previewDevice("iPad Pro (11-inch) (3rd generation)")
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
