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

    @IBOutlet weak var timeLeft: UIProgressView!
    @IBOutlet weak var lblDone: UILabel!
    let eggTimes: [String: Int] = ["Soft": 3, "Medium" : 4, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    var totalTime: Int = 0
    var secondPass: Int = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        // remove a timer
        timer.invalidate()
        
        print(sender.currentTitle ?? "")
        let hardness = sender.currentTitle ?? ""
        totalTime = eggTimes[hardness] ?? 60

        timeLeft.progress = 0
        secondPass = 0
        lblDone.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondPass < totalTime {
            secondPass += 1
            let percentageProgress = Float(secondPass) / Float(totalTime)
            timeLeft.progress = percentageProgress
        } else {
            timer.invalidate()
            lblDone.text = "Done"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer (contentsOf: url!)
            player.play()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.lblDone.text = "How do you like your eggs?"
                self.player.stop()
                print("Start again")
            }
        }
    }
}
