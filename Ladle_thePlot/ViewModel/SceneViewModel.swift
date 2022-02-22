//
//  SceneViewModel.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 19/02/22.
//

import SwiftUI
    
struct SceneViewModel {
    var scenesStorage :[RecipeScene] = [
        RecipeScene(name: "Add the powders", recipeName: "pizza", steps:["Add the flour!", "Add the sugar", "Add the yeast!"], stepIngredients: ["flour", "sugar", "yeast"],alternativeStepsIngredient: nil, container: "EmptyBowl", finalResult: nil),
        
        RecipeScene(name: "Mix to the powders", recipeName: "pizza", steps: ["Mix to create a hole in the middle!"], stepIngredients: nil, alternativeStepsIngredient: nil, container: nil, finalResult: "PowdersBowl"), // si potrebbe aggiungere una immagine con un buco in mezzo ??
        
        RecipeScene(name: "Add the liquids", recipeName: "pizza", steps:["Add the warm water!", "Add the oil"], stepIngredients: ["flour", "sugar", "yeast"],alternativeStepsIngredient: nil, container: "PowdersBowl", finalResult: nil), // Capire se è meglio passare una immagine dallo step precendente oppure mettere una immagine iniziale
        
        RecipeScene(name: "Mix to create the dough", recipeName: "pizza", steps: ["Mix to create the dough!"], stepIngredients: nil, alternativeStepsIngredient: nil, container: "LiquidBowl", finalResult: "FullBowl"),
        
        RecipeScene(name: "The dough has to growth", recipeName: "pizza", steps: ["Now the dough has to grow! Put a linen on the ipad and when you here a sound it means that the dough is ready."], stepIngredients: nil, alternativeStepsIngredient: nil, container: "dough", finalResult: nil), // when there is the leavening, use the scale effect
        
        RecipeScene(name: "Crush the dough to roll out the dough", recipeName: "pizza", steps: ["Crush the dough in order to obtain the pizza base!"], stepIngredients: nil, alternativeStepsIngredient: nil, container: nil, finalResult: "pizzadough"),
        
        
        RecipeScene(name: "Add the ingredients for the seasoning", recipeName: "pizza", steps: ["Add the pomodoro sauce!", "Add the salt!", "Add the oil!"], stepIngredients: ["pomodoro sauce", "salt", "oil"], alternativeStepsIngredient: nil, container: "EmptyBowl", finalResult: "pomodorosauce"),
        
        RecipeScene(name: "Spread the seasoning", recipeName: "pizza", steps: ["Spread the seasoning!"], stepIngredients: ["pomodoro sauce"], alternativeStepsIngredient: nil, container: "pizzadough", finalResult: "emptypizza"),
        
        RecipeScene(name: "Add mozzarella", recipeName: "pizza", steps: ["Add mozzarella!"], stepIngredients: ["mozzarella"], alternativeStepsIngredient: nil, container: "emptypizza", finalResult: nil),
        
        // for the ice cream
        RecipeScene(name: "Add ingredients", recipeName: "ice cream", steps: ["Add the condensed milk!", "Add the ice cubes", "Add strawberries", "Add banana"], stepIngredients: ["condensed milk", "ice cubes", "strawberries", "banana"], alternativeStepsIngredient: nil, container: "blender", finalResult: nil),
        
        RecipeScene(name: "Shake using the blender", recipeName: "ice cream", steps: ["Shake your iPad to blend the ingredients!"], stepIngredients: nil, alternativeStepsIngredient: nil, container: nil, finalResult: "blendingredients")
        
        ]
    
    // return the scenes about a recipe
    func getAllScenes(recipeName :String) -> [RecipeScene] {
        var scenes : [RecipeScene] {
            scenesStorage.filter {
                $0.recipeName == recipeName
            }
        }
        return scenes
    }
    

    // return the scene
    func getScene(stepName: String, recipeName :String) -> RecipeScene {
        return scenesStorage.first(where:  { $0.name.lowercased() ==  stepName && $0.recipeName.lowercased()  == recipeName})!
    }
    
    // if a new asset is asked at the starting point of the recipe
    func isEnvironmentNeeded(scene :RecipeScene) -> Bool {
        return scene.container == nil ? false : true
    }
    
    // if a new asset is asked at the end point of the recipe
    func isFinalResultNeeded(scene :RecipeScene) -> Bool {
        return scene.finalResult == nil ? false : true
    }
   
}


