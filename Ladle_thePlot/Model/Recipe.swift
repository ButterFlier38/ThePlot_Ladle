//
//  Recipe.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 11/02/22.
//

import SwiftUI

struct Recipe : Identifiable {
    var id = UUID()
    var name :String // name of the recipe
    var image :[String] // names of the images for each recipe
    var color :String
    var ingredients :[Int: String] // all the ingredients (A dictionary in which the key is the order of the ingredient in the recipe, and the value is the ingredient)
    var ingredientsQuantities :[Int: String] // all the ingredients quantities(A dictionary in which the key is the order of the ingredient in the recipe, and the value is the quantity of that ingredient)
    var alternativeIngredients :[Int :String] // all the alternative ingredients (A dictionary in which the key is the order of the ingredient in the recipe, and the value is the alternative ingredient)
    var alternativeQuantities :[Int :String] // all the quantities of the alternative ingredients (A dictionary in which the key is the order of the ingredient in the recipe, and the value is the quantity of the alternative ingredient)
    var steps : [Int:String]// the number of steps and the steps description
    var alternativeSteps : [Int:String]
    
//    internal init(name: String, image :[String], ingredients :[Int :String],ingredientsQuantities :[Int: String], alternativeIngredients :[Int :String],alternativeQuantities:[Int :String], steps :[Int:String],alternativeSteps : [Int:String], isChoosen: Bool) {
//        self.name = name
//        self.image = image
//        self.ingredients = ingredients
//        self.ingredientsQuantities = ingredientsQuantities
//        self.alternativeIngredients = alternativeIngredients
//        self.alternativeQuantities = alternativeQuantities
//        self.steps = steps
//        self.alternativeSteps = alternativeSteps
//        self.isChoosen = isChoosen
//    }
}


//FIND A WAY TO PROVIDE ALTERNATIVE INGREDIENTS
//maybe a dictionary with the number of the step and the alternative ingredient
