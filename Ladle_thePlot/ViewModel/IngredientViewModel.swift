//
//  IngredientModelView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
//


import SwiftUI

struct IngredientViewModel {
    
    var ingredientsStore : [Ingredient] = [
        Ingredient(name: "Flour", image: "flour", quantity: "500g", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Yeast", image: "yeast", quantity: "7g", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Pinch of Sugar", image: "sugar", quantity: "", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Water", image: "water", quantity: "", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Salt", image: "salt", quantity: "Pinch of", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Mozzarella", image: "mozzarella", quantity: "", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Pomodoro Sauce", image: "pomodorosauce", quantity: "", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Olive Oil", image: "oliveoil", quantity: "", recipeName: "pizza", isAlternative: false),
        Ingredient(name: "Condensed Milk", image: "condensedmilk", quantity: "100ml", recipeName: "ice cream", isAlternative: false),
        Ingredient(name: "Ice Cubes", image: "icecubes", quantity: "50g", recipeName: "ice cream", isAlternative: false),
        Ingredient(name: "Strawberries", image: "strawberry", quantity: "50g", recipeName: "ice cream", isAlternative: false),
        Ingredient(name: "Banana", image: "banana", quantity: "50g", recipeName: "ice cream", isAlternative: false),
        Ingredient(name: "Yogurt", image: "yogurt", quantity: "250g", recipeName: "ice cream", isAlternative: true),
        Ingredient(name: "Frozen Fruit", image: "frozenfruit", quantity: "250g", recipeName: "ice cream", isAlternative: true),
        Ingredient(name: "Honey", image: "honey", quantity: "40g", recipeName: "ice cream", isAlternative: true)
        ]
    
    
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
