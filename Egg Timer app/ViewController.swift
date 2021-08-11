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
    var player: AVAudioPlayer!
    
    @IBOutlet weak var lable: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTime = ["Soft":3,"Medium":4,"Hard":7]
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        
        totalTime=eggTime[hardness]!
        progressBar.progress=0.0
        secondsPassed = 0
        lable.text="How Do you like your egg"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil,repeats: true)
        
        }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed+=1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            print(Float(secondsPassed) / Float(totalTime))
            
            
        }else{
            timer.invalidate()
            lable.text="Egg is Ready"
            
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()        }
        
        
       
    }
    
    
}
