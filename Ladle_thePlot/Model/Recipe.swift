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
    var image :[String] // names of the images for each recipe
    var color :String
    var ingredients :[Int: String] // all the ingredients (A dictionary in which the key is the order of the ingredient in the recipe, and the value is the ingredient)
    var alternativeIngredients :[Int: String] // all the alternative ingredients (A dictionary in which the key is the order of the ingredient in the recipe, and the value is the alternative ingredient)
 
    var steps : [Int:String]// the number of steps and the steps description
  
    var alternativeSteps : [Int:String]
    var noofsteps : [Int]
}
