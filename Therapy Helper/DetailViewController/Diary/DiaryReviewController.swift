//
//  ChallengeDetailViewController.swift
//  Therapy Helper
//
//  Created by Josef on 15.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryReviewController: UIViewController {
    
    var diaryDataObject: DiaryDataObject!
    
    var diaryModel: DiaryModel?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //titleLabel.text = challenge?.title
        //textLabel.text = challenge?.text
        //counterLabel.text = (challenge?.counterCurrent.description)! + " / " + (challenge?.counterTotal.description)!
    }
    
    func setUp(diaryDataObject: DiaryDataObject) {
        self.diaryDataObject = diaryDataObject
    }
    
    
    
    
    
}
