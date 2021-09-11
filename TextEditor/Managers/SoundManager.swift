//
//  SoundManager.swift
//  TextEditor
//
//  Created by Artem Palyutin on 11.09.2021.
//

import Foundation
import AVKit


class SoundManager {
    static let instance = SoundManager()  // Singleton
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case save
        case delete
    }
    
    
    // MARK: - func
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("🔇 Error playing sound \(error.localizedDescription) ⚠️")
        }
    }
    
}

