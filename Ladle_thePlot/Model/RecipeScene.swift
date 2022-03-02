//  Scene.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 19/02/22.
//

import SwiftUI

struct RecipeScene :Identifiable {
    
    var id = UUID()
    var name :String
    var recipeName :String
    var sceneNumber :Int
    var steps :[String] // text to show into the vignettes, explaining the steps during the making part   was string before
    var stepIngredients :[String]? // all the ingredients that the step need to provide   was string before
    var alternativeStepsIngredient :[String]?
    var container :String? // starting image (empty bowl, blender)
    var finalResult :String? // the result at the end of the scene
}

