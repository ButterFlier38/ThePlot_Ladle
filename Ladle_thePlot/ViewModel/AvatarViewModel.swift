//
//  AvatarViewModel.swift
//  Ladle_thePlot
//
//  Created by Jasmine Aufiero on 15/02/22.
//

import SwiftUI

class AvatarViewModel : ObservableObject {
    @Published var selectedAvatar = Set<UUID>()
    
    var avatarsStorage : [Avatar] = [
    Avatar(name: "giorgia", image: "character_giorgia", headImage: "head_giorgia", backgroundColor: "bggreen", selectedColor: "selectiongreen"),
    
    Avatar(name: "gino", image: "character_gino", headImage: "head_gino", backgroundColor: "bgpink", selectedColor: "selectionpink"),
    
    Avatar(name: "tonia", image: "character_tonia", headImage: "head_tonia", backgroundColor: "bgblue", selectedColor: "selectionblue"),
    
    Avatar(name: "nino", image: "character_nino", headImage: "head_nino", backgroundColor: "bgyellow", selectedColor: "selectionyellow")]
 
    func isAvatarSelected(id: UUID) -> Bool {
        return selectedAvatar.contains(id) ? true : false
    }
    
//    func getAvatarName(name : String) -> Bool {
//        return selectedAvatar. ? true : false
//    }
    
    
    func toggleAvatarSelection(id: UUID) {
        if selectedAvatar.contains(id) {
            selectedAvatar.remove(id)
            print(selectedAvatar)
        }else {
            selectedAvatar.removeAll()
            selectedAvatar.insert(id)
            print(selectedAvatar)
        }
    }
    
    
    func getSelectedAvatar() -> Avatar { // which avatar is selected
   
        return avatarsStorage.first(where:  { $0.id ==  selectedAvatar.first})!
    }
    
    func isSomeAvatarSelected() -> Bool { // returns true if is empty
        return selectedAvatar.isEmpty
    }
}
