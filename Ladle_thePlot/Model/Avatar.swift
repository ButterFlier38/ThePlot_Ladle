//
//  Avatar.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 17/02/22.
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
