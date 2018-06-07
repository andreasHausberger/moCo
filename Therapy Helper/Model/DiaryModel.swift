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
    var managedDiaries: [Diary] = [Diary]()
    
    func saveDiary(_ diaryDataObject: DiaryDataObject)  {
        diaryDataObject.score = calculateDiaryScore(diaryDataObject)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Diary", in: context)
        
        let newDiary = Diary(entity: entity!, insertInto: context)
        newDiary.startTime = diaryDataObject.startTime
        newDiary.endTime = diaryDataObject.endTime
        newDiary.score = diaryDataObject.score!
        newDiary.patient_id = 111 // TODO: Figure This out
        
        newDiary.morningActivityList = convertToManagedObjects(diaryDataObject.morningActivities)
        newDiary.afternoonActivityList = convertToManagedObjects(diaryDataObject.afternoonActivities)
        newDiary.eveningActivityList = convertToManagedObjects(diaryDataObject.eveningActivities)
        
        diaries.append(diaryDataObject)
        
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
    
    private func convertToManagedObjects(_ entries: [DiaryEntryDataObject]) -> NSSet {
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
        return NSSet(array: managedEntries)
    }
    
    func loadDiaries() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        do {
            if let fetchedDiaries = try context.fetch(Diary.fetchRequest()) as? [Diary] {
                if !fetchedDiaries.isEmpty {
                    managedDiaries = fetchedDiaries
                    for diary in managedDiaries {
                        guard diary.startTime != nil && diary.endTime != nil else { return }
                        let diaryDataObject = DiaryDataObject(startTime: diary.startTime!, endTime: diary.endTime!, patientID: 111)
                        
                        diaryDataObject.morningActivities = diary.morningActivityList?.allObjects as! [DiaryEntryDataObject]
                        diaryDataObject.afternoonActivities = diary.afternoonActivityList?.allObjects as! [DiaryEntryDataObject]
                        diaryDataObject.eveningActivities = diary.eveningActivityList?.allObjects as! [DiaryEntryDataObject]
                    
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
