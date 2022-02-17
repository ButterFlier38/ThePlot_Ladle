//
//  Ingredient.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
//

import Foundation

struct Ingredient : Codable, Identifiable  {
    var id = UUID()
    var name :String
    var image :String
    var quantity :String
    var recipeName :String
    var isAlternative :Bool
}
