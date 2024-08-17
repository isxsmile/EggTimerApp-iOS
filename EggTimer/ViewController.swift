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
    var player: AVAudioPlayer?
    @IBOutlet var progresssBar: UIProgressView!
    
    let eggTimer=["Soft":5,"Medium":420,"Hard":720]
    var secondsPassed=0
    var totalTime=0
    var timer=Timer()
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness=sender.currentTitle!
        totalTime=eggTimer[hardness]!
        
        progresssBar.progress=0.0
        secondsPassed=0
        titleLabel.text="How do you like your eggs?"
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
    }
    
    

    
    @objc func updateCounter() {
        if secondsPassed<totalTime {
            secondsPassed+=1
            let percentage=Float(secondsPassed)/Float(totalTime)
            progresssBar.progress=percentage
        }
        else
        {
            timer.invalidate()
            titleLabel.text="DONE!"
            Play()
            
        }
        
    }
    func Play(){
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3")else{return}
        let soundURl = URL(fileURLWithPath: path)
        player = try? AVAudioPlayer(contentsOf: soundURl)
        player?.prepareToPlay()
        player?.play()
        //player.pause()
        //player.stop()
    }
    
}
