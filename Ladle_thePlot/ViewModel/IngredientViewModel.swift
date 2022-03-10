//
//  IngredientModelView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
//


import SwiftUI

struct IngredientViewModel {
    
    var ingredientsStore : [Ingredient] = [
        Ingredient(name: "Flour", image: "flour", droppedImage: "droppedflour", quantity: "500g", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Yeast", image: "yeast",droppedImage: nil, quantity: "7g", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Sugar", image: "sugar", droppedImage: nil, quantity: "Pinch of", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Water", image: "water", droppedImage: "droppedwater", quantity: "", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Salt", image: "salt",droppedImage: "droppedsalt", quantity: "Pinch of", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Mozzarella", image: "mozzarella", droppedImage: "droppedmozzarella",quantity: "", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Pomodoro Sauce", image: "pomodorosauce",droppedImage: "droppedpomodorosauce", quantity: "", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Olive Oil", image: "oliveoil", droppedImage:"droppedoil", quantity: "", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Condensed Milk", image: "condensedmilk", droppedImage:"droppedcondensedmilk",quantity: "100ml", recipeName: "ice cream", isAlternative: false),
        Ingredient(name: "Ice Cubes", image: "icecubes",droppedImage: nil, quantity: "50g", recipeName: "ice cream", isAlternative: false),
        Ingredient(name: "Strawberries", image: "strawberry", droppedImage: "droppedstrawberry", quantity: "50g", recipeName: "ice cream", isAlternative: false),
        Ingredient(name: "Banana", image: "banana", droppedImage: "droppedbanana", quantity: "50g", recipeName: "ice cream", isAlternative: false),
        Ingredient(name: "Yogurt", image: "yogurt", droppedImage: nil, quantity: "250g", recipeName: "ice cream", isAlternative: true),
        Ingredient(name: "Frozen Fruit", image: "frozenfruit", droppedImage: nil, quantity: "250g", recipeName: "ice cream", isAlternative: true),
        Ingredient(name: "Honey", image: "honey", droppedImage: nil, quantity: "40g", recipeName: "ice cream", isAlternative: true),
        
        Ingredient(name: "Ice Cubes", image: "icecubes", droppedImage: nil, quantity: "50g", recipeName: "crepe", isAlternative: false),
        Ingredient(name: "Strawberries", image: "strawberry", droppedImage: nil, quantity: "50g", recipeName: "crepe", isAlternative: false)
        ,
        Ingredient(name: "Milk", image: "milk", droppedImage: nil, quantity: "500ml", recipeName: "crepe", isAlternative: false),
        Ingredient(name: "Melted butter", image: "burro", droppedImage: nil, quantity: "50g", recipeName: "crepe", isAlternative: false),
        Ingredient(name: "Eggs", image: "egg", droppedImage: nil, quantity: "4", recipeName: "crepe", isAlternative: false),
        Ingredient(name: "Sugar", image: "sugar", droppedImage: nil, quantity: "15g", recipeName: "crepe", isAlternative: false),
        Ingredient(name: "Salt", image: "salt", droppedImage: nil, quantity: "Pinch of ", recipeName: "crepe", isAlternative: false),
        Ingredient(name: "Flour", image: "flour", droppedImage: nil, quantity: "550gr", recipeName: "crepe", isAlternative: false),
        Ingredient(name: "Fruit", image: "lampone", droppedImage: nil, quantity: "15g", recipeName: "crepe", isAlternative: false)
//        localized assets we arrived here. The assets that will be added from here on need to be added also to the localized strings file
        
        ]
    
    
//    [ "flour", "yeast", "pinch of sugar", "water", "salt", "mozzarella", "pomodoro sauce", "olive oil" ]
    
    
    
    // returns an ingredient from the name
    func getIngredient(ingredient :String, recipe :String) -> Ingredient? {
        if ingredient != "" {
            return ingredientsStore.first(where:  { $0.name.lowercased() ==  ingredient && $0.recipeName == recipe})!
        }
        return nil
    }
    
    // return all the ingredients from the recipe
    func getIngredientsFromTheRecipe(recipe :String) -> [Ingredient] {
        var ingredients : [Ingredient] {
            ingredientsStore.filter {
                $0.recipeName == recipe
            }
        }
        return ingredients
    }
}

