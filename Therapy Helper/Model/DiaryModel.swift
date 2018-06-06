//
//  DiaryModel.swift
//  Therapy Helper
//
//  Created by Andreas on 28.05.18.
//  Copyright © 2018 MoCo_Group2. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DiaryModel {
    var diaries: [DiaryDataObject] = [DiaryDataObject]()
    
    func saveDiary(_ diaryDataObject: DiaryDataObject)  {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Diary", in: context)
        
        let newDiary = Diary(entity: entity!, insertInto: context)
        newDiary.startTime = diaryDataObject.startTime
        newDiary.endTime = diaryDataObject.endTime
        newDiary.score = calculateDiaryScore(diaryDataObject)
        newDiary.patient_id = 111 // TODO: Figure This out
        newDiary.morningActivities = convertToManagedObjects(diaryDataObject.morningActivities) as NSArray
        newDiary.afternoonActivities = convertToManagedObjects(diaryDataObject.afternoonActivities) as NSArray
        newDiary.eveningActivities = convertToManagedObjects(diaryDataObject.eveningActivities) as NSArray
        
        delegate.saveContext()
    }
    
    private func calculateDiaryScore(_ diary: DiaryDataObject) -> Double {
        let allActivities = diary.morningActivities + diary.afternoonActivities + diary.eveningActivities
        var positiveScore = 0.0
        var negativeScore = 0.0
        for activity in allActivities {
            positiveScore += activity.emotion_positive!
            negativeScore += activity.emotion_anger!
            negativeScore += activity.emotion_worry!
            negativeScore += activity.emotion_fatigue!
        }
        let quotient = (positiveScore * 3) / negativeScore
        var result = quotient * 5.0
        
        if result < 1 { result = 1 }
        if result > 10 { result = 10 }
        return result
    }
    
    private func convertToManagedObjects(_ entries: [DiaryEntryDataObject]) -> [DiaryEntry] {
        var managedEntries = [DiaryEntry]()
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "DiaryEntry", in: context)
        
        for entry in entries {
            let newEntry = DiaryEntry(entity: entity!, insertInto: context)
            
            newEntry.creationDate = entry.creationTime
            newEntry.emotion_anger = entry.emotion_anger!
            newEntry.emotion_fatigue = entry.emotion_fatigue!
            newEntry.emotion_worry = entry.emotion_worry!
            newEntry.emoition_positive = entry.emotion_positive!
            managedEntries.append(newEntry)
        }
        return managedEntries
    }
    
    func loadDiaries() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        do {
            if let fetchedDiaries = try
                context.fetch(Diary.fetchRequest()) as? [Diary] {
                if (!fetchedDiaries.isEmpty) {
                    for diary in fetchedDiaries {
                        let newDiaryDataObject = DiaryDataObject(startTime: diary.startTime!, endTime: diary.endTime!, patientID: Int(diary.patient_id))
                        
                        if let morningActivities = convertToDataObjects(diary.morningActivities as! [DiaryEntry]) as? [DiaryEntryDataObject] {
                            newDiaryDataObject.morningActivities = morningActivities
                        }
                        
                        if let afternoonActivities = convertToDataObjects(diary.afternoonActivities as! [DiaryEntry]) as? [DiaryEntryDataObject]  {
                            newDiaryDataObject.afternoonActivities = afternoonActivities
                        }
                        if let eveningActivities = convertToDataObjects(diary.eveningActivities as! [DiaryEntry]) as? [DiaryEntryDataObject] {
                            newDiaryDataObject.eveningActivities = eveningActivities
                        }
                        
                        diaries.append(newDiaryDataObject)
                    }
                }
            }
        }
        catch {
            print("Fetch failed")
        }
    }
    
    private func convertToDataObjects(_ entries: [DiaryEntry]) -> [DiaryEntryDataObject] {
        var dataObjects = [DiaryEntryDataObject]()
        for entry in entries {
            let dataObject = DiaryEntryDataObject(text: entry.text!, emotion_positive: entry.emoition_positive, emotion_fatigue: entry.emotion_fatigue, emotion_anger: entry.emotion_anger, emotion_worry: entry.emotion_worry, creationTime: entry.creationDate!)
            
            dataObjects.append(dataObject)
        }
        return dataObjects
    }
    
    func getDiaries() -> [DiaryDataObject] {
        return diaries
    }
    
}
