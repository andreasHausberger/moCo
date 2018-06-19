//
//  ChallengeDetailViewController.swift
//  Therapy Helper
//
//  Created by Andreas on 15.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class ChallengeDetailViewController: UIViewController {
    
    var challenge: ChallengeDataObject!
    
    var challengeModel: ChallengeModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = challenge?.title
        textLabel.text = challenge?.text
        counterLabel.text = (challenge?.counterCurrent.description)! + " / " + (challenge?.counterTotal.description)!
    }
    
    func setUp(challenge: ChallengeDataObject) {
        self.challenge = challenge
    }
    
    @IBAction func addToCounter(_ sender: Any) {
        challenge!.counterCurrent = challenge!.counterCurrent + 1
        counterLabel.text = (challenge?.counterCurrent.description)! + " / " + (challenge?.counterTotal.description)!
    }
    
    
    @IBAction func removeFromCounter(_ sender: Any) {
        if (challenge!.counterCurrent > 0) {
            challenge!.counterCurrent = challenge!.counterCurrent - 1
            counterLabel.text = (challenge?.counterCurrent.description)! + " / " + (challenge?.counterTotal.description)!
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        challengeModel!.updateChallenge(self.challenge!)
        super.viewWillDisappear(animated)
        
    }
    
    
    
    
}
