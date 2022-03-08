//
//  SoundManager.swift
//  Ladle_thePlot
//
//  Created by Irene Fernando on 05/03/22.
//

import Foundation
import AVKit

class SoundManager{
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    func playSound(_ songName: String, spd : Float, vol: Float){
        guard let url = Bundle.main.url(forResource: songName, withExtension: nil) else {return}
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.volume = vol
            player?.rate = spd
        } catch let error{
            print("Error playing sound \(error.localizedDescription)")
        }
    }
}

