//
//  ContentView.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 11/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView  {
//            AvatarSelectionView()
            NameInputView()
        }.navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
    
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
