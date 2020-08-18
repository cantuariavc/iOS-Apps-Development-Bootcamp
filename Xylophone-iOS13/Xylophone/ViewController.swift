//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        playSound(keyTitle: sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { sender.alpha = 1.0 }
    }
    
    func playSound(keyTitle: String) {
        let url = Bundle.main.url(forResource: keyTitle, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

