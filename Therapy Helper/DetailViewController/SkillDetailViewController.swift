//
//  SkillDetailViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 06.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit
import AVFoundation

class SkillDetailViewController: UIViewController {
    
    var skill: SkillDataObject?
    var minutes: Int?
    var seconds: Int = 0
    var backgroundColor: UIColor?
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var timer: UILabel!
    
    @IBOutlet weak var timerButton: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var countdownTimer: Timer = Timer()
    
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard skill != nil else { return }
        self.titleLabel.text = skill!.name
        self.descriptionLabel.text = skill!.text
        self.timer.text = skill!.timer.description + ":00"

        self.backgroundView.layer.cornerRadius = 20
        self.backgroundView.backgroundColor = self.backgroundColor
        self.minutes = skill!.timer
        
        if minutes! <= 0 {
            self.timer.isHidden = true
            self.timerLabel.text = "Untimed"
            self.timerButton.isHidden = true
        }
    }
    
    func setUp(skill: SkillDataObject) {
        self.skill = skill
        
        switch skill.category {
        case 1:
            self.backgroundColor = UIColor(displayP3Red: 0.98, green: 0.78, blue: 0, alpha: 0.75)
            return
        case 2:
            self.backgroundColor = UIColor(displayP3Red: 0.35, green: 0.78, blue: 0.98, alpha: 0.75)
            return
        case 0:
            self.backgroundColor = UIColor(displayP3Red: 0.60, green: 0.60, blue: 0.60, alpha: 0.75)
        default:
            self.backgroundColor = UIColor(displayP3Red: 0.60, green: 0.60, blue: 0.60, alpha: 0.75)
            
        }
        
    }
    
    
    @IBAction func startTimer(_ sender: UIButton) {
        print("button clicked")
        if !isTimerRunning {
            self.minutes = self.skill?.timer
            runTimer()
        }
    }
    
    private func runTimer() {
        isTimerRunning = true
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.isTimerRunning {
                self.seconds -= 1
                if self.seconds < 0 {
                    self.minutes! -= 1
                    self.seconds = 59
                }
                
                self.timer.text = "\(self.minutes!):\(self.seconds)"

                
                if self.minutes! == 0 && self.seconds == 0 {
                    self.isTimerRunning = false
                    self.notifyTimerEnding()
                    self.countdownTimer.invalidate()
                    self.timer.text = self.skill!.timer.description + ":00"
                }
            }
        }
    }
    
    private func notifyTimerEnding() {
        print("Timer has ended")
        let alert = UIAlertController(title: "Timer", message: "The Timer has ended!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default)
        { (UIAlertAction) -> Void in
            alert.dismiss(animated: true, completion: nil)
        })
        AudioServicesPlayAlertSound(SystemSoundID(1023))
        self.present(alert, animated: true, completion: nil)
        
    }

}
