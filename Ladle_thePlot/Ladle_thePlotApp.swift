//
//  Ladle_thePlotApp.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 11/02/22.
//

import SwiftUI

@main
struct Ladle_thePlotApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AvatarViewModel())
        }
    }
}
