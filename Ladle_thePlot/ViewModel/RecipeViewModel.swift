//
//  RecipeList.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 12/02/22.
//

import SwiftUI

class RecipeViewModel : ObservableObject{
    
    @Published private var selectedRecipe = UUID() //id of the selected recipe
    
    
//    Add the new recipes here...
    @Published var recipesStore: [Recipe] =
    [Recipe(name: "pizza", image: ["pizza1"], color: "bgyellow" ,ingredients: [1: "flour", 2: "yeast", 3: "pinch of sugar", 4: "water", 5: "salt",6: "mozzarella", 7: "pomodoro sauce", 8: "olive oil" ], alternativeIngredients: [0 : ""], steps: [1: "First of all we have to make the dough. Put the flour, sugar and yeast in a bowl and  make a hole in the middle.", 2: "Add the oil and water. Stir with a wooden spoon until you have a sticky dough. Add a splash more water if needed.", 3: "Scatter a bit of flour over the surface and tip the dough onto it. Work it until you have a ball (10 mins).  Make sure that the dough is smooth and elastic.", 4: "Brush a clean bowl with a little olive oil, put the dough in it and cover with cling film. Leave it somewhere warm for it to grow until doubled in size.", 5: "Roll out the dough. Heat oven to 220C fan. Brush the baking trays with extra oil and roll out the dough, then lift onto the baking tray. Use the back of the spoon to spread the sauce over the dough.Bake the pizza for 12-15 mins until puffed up and golden around the edges, then carefully lift out of the oven. Leave to cool slightly."], alternativeSteps: [0 : ""], noofsteps: [1,2,3,4]),
     
     Recipe(name: "ice cream", image: ["icecream1", "icecream2"],color: "bgpink", ingredients: [1 : "condensed milk", 2: "ice cubes", 3: "strawberries", 4: "banana"], alternativeIngredients: [1: "yogurt", 2: "", 3: "frozen fruit", 4: "honey"], steps: [1: "Take the condensed milk and add it to the blender. Then take the ice and add it too.", 2: "Now take the strawberries, wash them and cut them in half.  Repeat the process with the banana.Finally add the fruit to the blender and turn it on!"], alternativeSteps: [1: "Take the chosen fruit, wash it, peel it, cut it in cubes and feeeze it for at least 5 hours.", 2: "Now take the frozen fruit out of the refrigerator and put it in the blener. Finally add the yogurt and the honey and turn the blender on!"], noofsteps: [1,2,3])]
    
    func isRecipeSelected(id: UUID) -> Bool {
        return selectedRecipe == id ? true : false
    }
    
    func getSelectedRecipe() -> [Recipe] { // which recipe is selected
        return recipesStore.filter { recipe in
            selectedRecipe == recipe.id
        }
    }
    
    // get all the ingredients of the recipe
    func getIngredients(recipe :Recipe) -> [String] {
        var ingredients :[String] = []
        for(key, value) in recipe.ingredients {
            ingredients.insert(value, at: key)
        }
        return ingredients
    }
    
//    // get the quantity of one ingredient
//    func getIngredientQuantity(recipe :Recipe, ingredientkey :String) -> String {
//        return recipe.ingredientsQuantities[ingredientkey] ?? ""
//    }
    
}
