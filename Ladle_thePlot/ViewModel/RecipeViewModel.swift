//
//  RecipeList.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 12/02/22.
//

import SwiftUI

struct RecipeViewModel {
    
    //    Add the new recipes here...
    var recipesStore: [Recipe] =
    [Recipe(name: "pizza", image: "pizza1", color: "bggreen" ,ingredients: [ "flour", "yeast", "sugar", "water", "salt", "mozzarella", "pomodoro sauce", "olive oil" ], alternativeIngredients: nil, recipeSteps: ["First of all we have to make the dough. Put the flour, sugar and yeast in a bowl and  make a hole in the middle.", "Add the oil and water. Stir with a wooden spoon until you have a sticky dough. Add a splash more water if needed.", "Scatter a bit of flour over the surface and tip the dough onto it. Work it until you have a ball (10 mins).  Make sure that the dough is smooth and elastic.", "Brush a clean bowl with a little olive oil, put the dough in it and cover with cling film. Leave it somewhere warm for it to grow until doubled in size.", "Roll out the dough. Heat oven to 220C fan. Brush the baking trays with extra oil and roll out the dough, then lift onto the baking tray. Use the back of the spoon to spread the sauce over the dough.", "Bake the pizza for 12-15 mins until puffed up and golden around the edges, then carefully lift out of the oven. Leave to cool slightly."], recipeAlternativeSteps: nil, scenes: ["Add the powders", "Add the liquids", "Mix to create the dough", "Crush the dough", "Roll out the dough", "The dough has to growth", "Add the ingredients for the seasoning", "Spread the seasoning","Add mozzarella","Bake in the oven"],islocked: false),
     
     Recipe(name: "ice cream", image: "icecream1" ,color: "bgpink", ingredients: ["condensed milk", "ice cubes", "strawberries", "banana"], alternativeIngredients: ["yogurt",  "", "frozen fruit", "honey"], recipeSteps: ["Take the condensed milk and add it to the blender. Then take the ice and add it too.", "Now take the strawberries, wash them and cut them in half.  Repeat the process with the banana.Finally add the fruit to the blender and turn it on!"], recipeAlternativeSteps: ["Take the chosen fruit, wash it, peel it, cut it in cubes and feeeze it for at least 5 hours.", "Now take the frozen fruit out of the refrigerator and put it in the blener. Finally add the yogurt and the honey and turn the blender on!"], scenes: ["Add ingredients","Shake using the blender"],islocked: false),
     
     Recipe(name: "crepe", image: "crepe" ,color: "bgblue", ingredients: ["milk", "eggs", "melted butter", "sugar","salt","flour","fruit"], alternativeIngredients: ["yogurt",  "", "frozen fruit", "honey"], recipeSteps: ["Place the milk, eggs, melted butter, sugar, vanilla, salt, and flour into a blender. Blend until the batter Melt a small of pat of butter in a frying pan over medium-low heat.", "Pour about 1/4 cup batter into the pan. Turn the pan from side to side to make an even circle.Cook the crepe until lightly browned. Then flip it over and cook the other side. Repeat the process. Place a crepe on a plate and add chocolate and fruit to the center.Roll it up and it???s ready to eat!"], recipeAlternativeSteps: [""], scenes: ["Add ingredients","Rotate the pan"],islocked: true),
     
     Recipe(name: "pannaicecream", image: "icecream2" ,color: "bgyellow", ingredients: ["", ""], alternativeIngredients: [""], recipeSteps: [""], recipeAlternativeSteps: [""], scenes: [""],islocked: true),
     
     Recipe(name: "spagetti", image: "spagetti" ,color: "bggreen", ingredients: ["", ""], alternativeIngredients: [""], recipeSteps: [""], recipeAlternativeSteps: [""], scenes: [""],islocked: true),
     
     Recipe(name: "meatballs", image: "meatballs" ,color: "bgpink", ingredients: ["", ""], alternativeIngredients: [""], recipeSteps: [""], recipeAlternativeSteps: [""], scenes: [""],islocked: true)
     
    ]
     
     
     // get all the ingredients of the recipe
     func getIngredients(recipe :Recipe) -> [String] {
         return recipe.ingredients
    }
    
    func getScenes(recipe :Recipe) -> [String] {
        return recipe.recipeSteps
   }
    
     // returns true if there is an alternative way to make the same recipe
     func hasAlternatives(recipe :Recipe) -> Bool {
        if recipe.alternativeIngredients != nil {
            return true
        }
        return false
    }
}
     
