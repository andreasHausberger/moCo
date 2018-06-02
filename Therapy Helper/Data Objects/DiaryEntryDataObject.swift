//
//  DiaryEntry.swift
//  Therapy Helper
//
//  Created by Andreas on 28.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation

class DiaryEntryDataObject {
    
    var text: String
    var emotion_positive: Double
    var emotion_fatigue: Double
    var emotion_anger: Double
    var emotion_worry: Double
    var timeFrame: Int? //0 for morning, 1 for afternoon, 2 for evening
    var creationTime: Date
    
    init(text: String, emotion_positive: Double, emotion_fatigue: Double, emotion_anger: Double, emotion_worry: Double, creationTime: Date) {
        self.text = text
        self.emotion_anger = emotion_anger
        self.emotion_fatigue = emotion_fatigue
        self.emotion_positive = emotion_positive
        self.emotion_worry = emotion_worry
        self.creationTime = creationTime

    }
    
    func tryAddTimeFrame(timeFrame: Int) -> Bool {
        guard timeFrame <= 0 && timeFrame >= 2 else { return false }
        self.timeFrame = timeFrame
        return true;
    }
    
}
