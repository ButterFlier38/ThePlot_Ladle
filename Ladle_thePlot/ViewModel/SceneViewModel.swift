//
//  SceneViewModel.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 19/02/22.
//

import SwiftUI
    
struct SceneViewModel {
    var scenesStorage :[RecipeScene] = [
        RecipeScene(name: "Add the powders!", recipeName: "pizza", sceneNumber: 1, steps:["Add the flour!", "Add the sugar", "Add the yeast!"], stepIngredients: ["flour", "sugar", "yeast"],alternativeStepsIngredient: nil, container: "spianatoia", finalResult: "powders"),
        
        RecipeScene(name: "Add the liquids!", recipeName: "pizza", sceneNumber: 2, steps:["Add the warm water!", "Add the oil"], stepIngredients: ["olive oil", "water"],alternativeStepsIngredient: nil, container: "powders", finalResult: "powdersWithLiquids"), // Capire se è meglio passare una immagine dallo step precendente oppure mettere una immagine iniziale
        
        RecipeScene(name: "Mix to create the dough!", recipeName: "pizza", sceneNumber: 3, steps: ["Mix to create the dough!"], stepIngredients: nil, alternativeStepsIngredient: nil, container: "powdersWithLiquids", finalResult: "dough"),
        
        RecipeScene(name: "Crush the dough by tapping it!", recipeName: "pizza", sceneNumber: 4, steps: ["Crush the dough by tapping it!"], stepIngredients: nil, alternativeStepsIngredient: nil, container: "dough", finalResult: nil),
        
        RecipeScene(name: "The dough has to growth!", recipeName: "pizza", sceneNumber: 5, steps: ["Now the dough has to grow! Put a linen on the ipad and when you here a sound it means that the dough is ready."], stepIngredients: nil, alternativeStepsIngredient: nil, container: "doughBeforeLeavening", finalResult: "doughAfterLeavening"), // when there is the leavening, use the scale effect

        RecipeScene(name: "Roll out the dough by tapping on rolling pin!", recipeName: "pizza", sceneNumber: 6, steps: ["Roll out the dough in order to obtain the pizza base!"], stepIngredients: nil, alternativeStepsIngredient: nil, container: "dough", finalResult: "pizzadough"),
        
        RecipeScene(name: "Add the ingredients for the seasoning!", recipeName: "pizza", sceneNumber: 7, steps: ["Add the pomodoro sauce!", "Add the salt!", "Add the oil!"], stepIngredients: ["pomodoro sauce", "salt", "olive oil"], alternativeStepsIngredient: nil, container: "bowl", finalResult: "pomodorosauce"),
        
        RecipeScene(name: "Spread the seasoning!", recipeName: "pizza", sceneNumber: 8, steps: ["Spread the seasoning!"], stepIngredients: ["pomodoro sauce"], alternativeStepsIngredient: nil, container: "pizzadough", finalResult: "emptypizza"),
        
        RecipeScene(name: "Add mozzarella!", recipeName: "pizza", sceneNumber: 9, steps: ["Add mozzarella!"], stepIngredients: ["mozzarella"], alternativeStepsIngredient: nil, container: "emptypizza", finalResult: "rawpizza"),
        
        RecipeScene(name: "Place in the oven", recipeName: "pizza", sceneNumber: 10, steps: ["Place it in the oven "], stepIngredients: nil, alternativeStepsIngredient: nil, container: "rawpizza", finalResult: "pizza1"),
        
        // for the ice cream
        RecipeScene(name: "Add ingredients", recipeName: "ice cream", sceneNumber: 1, steps: ["Add the condensed milk!", "Add the ice cubes", "Add strawberries", "Add banana"], stepIngredients: ["condensed milk", "ice cubes", "strawberries", "banana"], alternativeStepsIngredient: nil, container: "blender", finalResult: nil),
        
        RecipeScene(name: "Shake using the blender", recipeName: "ice cream", sceneNumber: 2, steps: ["Shake your iPad to blend the ingredients!"], stepIngredients: nil, alternativeStepsIngredient: nil, container: "ingredientsblender", finalResult: "fullblender"),
        
        RecipeScene(name: "Add ingredients", recipeName: "crepe", sceneNumber: 1, steps: ["Add the milk!", "Add the eggs", "Add butter", "Add sugar"], stepIngredients: ["milk", "eggs", "melted butter", "sugar","salt","flour"], alternativeStepsIngredient: nil, container: "blender", finalResult: nil),
        
        RecipeScene(name: "Shake using the blender", recipeName: "crepe", sceneNumber: 2, steps: ["Shake your iPad to blend the ingredients!"], stepIngredients: nil, alternativeStepsIngredient: nil, container: "blender", finalResult: "blendingredients")
        
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


