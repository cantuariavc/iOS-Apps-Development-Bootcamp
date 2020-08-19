//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var eggStatus: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 2, "Medium": 4, "Hard": 6]
    var hardnessTime: Float = 0.0
    var counter = 0
    var timer = Timer()
    
    
    @IBAction func eggPressed(_ sender: UIButton) {
        timer.invalidate()
        eggStatus.text = nil
        progressBar.progress = 0
        
        let hardness = sender.currentTitle!
        counter = eggTimes[hardness]!
        hardnessTime = Float(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }



    @objc func updateCounter() {
        if counter > 0 {
            progressBar.progress += 1/hardnessTime
            counter -= 1
        } else {
            eggStatus.text = "Done!"
            
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
        
    
}
