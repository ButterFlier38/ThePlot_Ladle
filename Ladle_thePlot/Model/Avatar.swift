//
//  Avatar.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 13/02/22.
//

import SwiftUI

struct Avatar : Codable, Identifiable {
    var id = UUID()
    var name :String
    var image :String
    var headImage :String
    var backgroundColor :String
    var selectedColor :String
}
