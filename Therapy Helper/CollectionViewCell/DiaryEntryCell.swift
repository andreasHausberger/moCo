//
//  DiaryEntryCell.swift
//  Therapy Helper
//
//  Created by Andreas on 02.06.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import UIKit

class DiaryEntryCell: UICollectionViewCell {
    
    var diaryEntry: DiaryEntryDataObject?
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var angerScore: UILabel!
    
    @IBOutlet weak var fatigueScore: UILabel!
    
    @IBOutlet weak var worryScore: UILabel!
    
    @IBOutlet weak var positiveScore: UILabel!
    
    func setUp(diaryEntry: DiaryEntryDataObject) {
        self.text.text = diaryEntry.text
        self.angerScore.text = diaryEntry.emotion_anger?.description
        self.fatigueScore.text = diaryEntry.emotion_fatigue?.description
        self.worryScore.text = diaryEntry.emotion_worry?.description
        self.positiveScore.text = diaryEntry.emotion_positive?.description
        
        self.diaryEntry = diaryEntry
    }
}
