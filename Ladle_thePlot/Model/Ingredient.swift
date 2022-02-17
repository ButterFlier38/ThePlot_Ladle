//
//  Ingredient.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 13/02/22.
//

import SwiftUI

struct Ingredient : Codable, Identifiable  {
    var id = UUID()
    var name :String
    var image :String
}
