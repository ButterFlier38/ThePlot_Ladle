//
//  Recipe.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
//


import SwiftUI

struct Recipe : Identifiable {
    var id = UUID()
    var name :String // name of the recipe
    var image :String // name of the image
    var color :String
    var ingredients :[String]
    var alternativeIngredients :[String]?
    var recipeSteps : [String]// the number of steps and the steps description
    var recipeAlternativeSteps : [String]?
    var scenes :[String]
}
