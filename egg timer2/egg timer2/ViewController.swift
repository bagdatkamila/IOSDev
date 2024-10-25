//
//  ViewController.swift
//  egg timer2
//
//  Created by Камила Багдат on 22.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes: [String: Int] = ["soft": 300, "medium": 420, "hard": 720]
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var player: AVAudioPlayer?
    var timer = Timer()
    var timePassed: Float = 0
    var totalTime: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        timer.invalidate()
        
        if let eggType = sender.currentTitle {
            progressBar.progress = 0.0
            timePassed = 0.0
            totalTime = Float(eggTimes[eggType]!)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        } else {
            print("Error: Button title is nil")
        }
    }
    
    @objc func updateTimer() {
        timePassed += 1.0
        progressBar.progress = timePassed / totalTime
        timerLabel.text = String(format: "%02d:%02d", Int(timePassed / 60), Int(timePassed.truncatingRemainder(dividingBy: 60)))
        
        if timePassed >= totalTime {
            if let player = player {
                player.stop()
            }
            timer.invalidate()
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm", withExtension: "wav")!
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        return String(format: "%02d:%02d", Int(totalSeconds / 60), Int(totalSeconds % 60))
    }
}
    

