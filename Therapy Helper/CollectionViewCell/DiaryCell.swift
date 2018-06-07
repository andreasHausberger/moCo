//
//  DiaryCell.swift
//  Therapy Helper
//
//  Created by Andreas on 29.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryCell: UICollectionViewCell {
    
    var diaryDataObject: DiaryDataObject?
    
    @IBOutlet weak var weekdayLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    func setUp(_ diaryDataObject: DiaryDataObject) {
        self.diaryDataObject = diaryDataObject
        weekdayLabel.text = diaryDataObject.startTime.description
        textLabel.text = "Lorem Ipsum Dolor sit amet"
        scoreLabel.text = diaryDataObject.score?.description
        
    }
    
    
}
